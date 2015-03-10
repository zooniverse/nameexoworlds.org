class AddDescriptionToProposedNames < ActiveRecord::Migration
  def change
    add_column :proposed_names, :description, :text
  end
end
