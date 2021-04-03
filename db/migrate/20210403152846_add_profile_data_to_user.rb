class AddProfileDataToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :first_name, :string, null: false, default: ''
    add_column :users, :last_name, :string, null: false, default: ''
    add_column :users, :gender, :string, null: false, default: ''
    add_column :users, :date_of_birth, :string, null: false, default: ''
    add_column :users, :blood_group, :string, null: false
    add_index :users, :blood_group
    add_column :users, :role, :string, null: false, default: 'donor'
    add_index :users, :role
    add_column :users, :phone, :string, null: false, unique: true
    add_index :users, :phone, unique: true
  end
end
