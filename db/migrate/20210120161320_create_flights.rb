class CreateFlights < ActiveRecord::Migration[5.2]
  def change
    create_table :flights do |t|
      t.integer :number
      t.date :date
      t.time :time
      t.string :departure_city
      t.string :arrival_city
      t.references :airline, foreign_key: true
    end
  end
end
