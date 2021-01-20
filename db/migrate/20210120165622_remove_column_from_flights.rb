class RemoveColumnFromFlights < ActiveRecord::Migration[5.2]
  def change
    remove_column :flights, :time
  end
end
