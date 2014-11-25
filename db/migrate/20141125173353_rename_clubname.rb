class RenameClubname < ActiveRecord::Migration
  def change

    rename_column :clubs, :name, :username

  end
end
