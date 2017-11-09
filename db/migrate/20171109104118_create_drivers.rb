class CreateDrivers < ActiveRecord::Migration[5.1]
  def change
    create_table :drivers do |t|
      t.integer :usual_distance_per_day
      t.integer :destination_type
      t.references :user, foreign_key: true
      t.text :description
      t.string :bank_account
      t.string :proof_of_address
      t.string :parking_card
      t.string :start_address
      t.string :destination_address
      t.integer :journey_lenght_type
      t.float :journey_length
      t.integer :journey_period
      t.string :extra_start_address
      t.string :extra_destination_address
      t.float :extra_journey_length
      t.string :start_address_zipcode
      t.string :destination_address_zipcode

      t.timestamps
    end
  end
end
