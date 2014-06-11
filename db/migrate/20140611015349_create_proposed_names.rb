class CreateProposedNames < ActiveRecord::Migration
  def change
    create_table :proposed_names do |t|
      t.string   :name
      t.integer  :planet_id
      t.integer  :vote_count
      t.integer  :proposing_organisation_id
      t.timestamps
    end
  end
end
