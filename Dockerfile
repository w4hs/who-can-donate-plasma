FROM ruby:2.7.1-alpine
RUN apk add --no-cache \
    git build-base yarn nodejs npm postgresql-dev tzdata \
    && rm -rf /var/cache/apk/*

RUN mkdir /app
WORKDIR /app
ADD . /app
COPY config/database.yml.sample config/database.yml

RUN yarn install --check-files
RUN gem update --system
RUN gem install bundler:2.1.4
RUN bundle config set deployment true
RUN bundle install --deployment --jobs 4

COPY entrypoint.sh /bin/entrypoint.sh

RUN ["chmod", "+x", "/bin/entrypoint.sh"]

ENTRYPOINT [ "/bin/entrypoint.sh" ]

CMD [ "bundle", "exec", "rake db:migrate" ]

CMD [ "bundle", "exec", "rake assets:precompile" ]

CMD [ "bundle", "exec", "rails s" ]
