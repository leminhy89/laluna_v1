class CreateCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :categories do |t|
      t.string :name
      t.string :description
      t.string :parentCate
      t.string :created_by
      t.string :updated_by
      t.boolean :delete_flag

      t.timestamps
    end
  end
end
