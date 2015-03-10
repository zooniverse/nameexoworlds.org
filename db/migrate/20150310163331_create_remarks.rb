class CreateRemarks < ActiveRecord::Migration
  def change
    create_table :remarks do |t|
      t.integer  :club_id
      t.integer  :system_id
      t.text     :body
      t.timestamps
    end
  end
end
