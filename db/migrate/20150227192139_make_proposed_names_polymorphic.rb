class MakeProposedNamesPolymorphic < ActiveRecord::Migration
  def change
    add_column :proposed_names, :nameable_entity_id, :integer
    add_column :proposed_names, :nameable_entity_type, :string
  end
end
