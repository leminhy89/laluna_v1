class CreateLanguages < ActiveRecord::Migration[5.0]
  def change
    create_table :languages do |t|
      t.string :name
      t.string :description
      t.string :created_by
      t.string :updated_by
      t.boolean :delete_flag

      t.timestamps
    end
  end
end
