module Constants
  BLOOD_GROUPS = %w(A+ A- B+ B- AB+ AB- O+ O-)
  
  GENDERS = {
      'male':   I18n.t('users.genders.male'),
      'female': I18n.t('users.genders.female'),
      'others': I18n.t('users.genders.others')
  }
end
