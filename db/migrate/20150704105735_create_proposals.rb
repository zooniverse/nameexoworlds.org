class CreateProposals < ActiveRecord::Migration
  def change
    create_table :proposals do |t|
      t.references :club
      t.references :system
      t.timestamps
    end
  end
end
