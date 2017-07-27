class CreateAirplanes < ActiveRecord::Migration[4.2]

  def change
    create_table :airplanes do |t|
      t.string :manufacturer
      t.string :aircraft_type
      t.string :tail_number
      t.string :time_in_type
      t.string :last_flight
      t.string :last_checkout
      t.string :comments
      t.integer :user_id
    end
  end
end
