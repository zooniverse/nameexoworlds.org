class CreateProposingOrganisations < ActiveRecord::Migration
  def change
    create_table :proposing_organisations do |t|
      t.string       :name
      t.string       :description
      t.string       :uid
      t.timestamps
    end
  end
end
