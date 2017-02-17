class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.integer :role_id
      t.string :description
      t.string :email
      t.string :encrypt_password
      t.string :salt
      t.boolean :delete_flag
      t.string :created_by
      t.string :updated_by

      t.timestamps
    end
  end
end
