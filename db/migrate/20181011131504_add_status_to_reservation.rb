class AddStatusToReservation < ActiveRecord::Migration[5.2]
  def change
    add_column :reservations, :pay_status, :boolean
  end
end
