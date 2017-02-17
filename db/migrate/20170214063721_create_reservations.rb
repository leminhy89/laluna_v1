class CreateReservations < ActiveRecord::Migration[5.0]
  def change
    create_table :reservations do |t|
      t.string :name
      t.string :description
      t.datetime :reservation_date
      t.integer :adult
      t.integer :child
      t.integer :status_id
      t.string :created_by
      t.string :updated_by
      t.boolean :delete_flag

      t.timestamps
    end
  end
end
