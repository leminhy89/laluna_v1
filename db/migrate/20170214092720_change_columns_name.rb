class ChangeColumnsName < ActiveRecord::Migration[5.0]
  def change
    rename_column :reservations, :status_id, :reservation_status_id
  end
end
