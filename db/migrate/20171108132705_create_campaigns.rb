class CreateCampaigns < ActiveRecord::Migration[5.1]
  def change
    create_table :campaigns do |t|
      t.string :name
      t.date :start_date
      t.integer :user_id
      t.integer :status
      t.integer :nb_cars
      t.boolean :is_public
      t.string :logo
      t.text :public_description
      t.string :workflow_state

      t.timestamps
    end
  end
end
