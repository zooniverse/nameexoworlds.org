class AddExtraInfoToUsers < ActiveRecord::Migration

  def up
    add_column :users, :extra_info, :hstore
  end

  def down
    remove_column :users, :extra_info
  end

end
