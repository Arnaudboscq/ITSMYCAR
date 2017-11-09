class CreateCandidacies < ActiveRecord::Migration[5.1]
  def change
    create_table :candidacies do |t|
      t.references :user, foreign_key: true
      t.references :campaign, foreign_key: true
      t.string :workflow_state
      t.string :string
      t.boolean :profil_incomplet
      t.boolean :mauvaise_zone
      t.boolean :autre
      t.boolean :notif
      t.boolean :display
      t.boolean :notif_in_bo_discarded

      t.timestamps
    end
  end
end
