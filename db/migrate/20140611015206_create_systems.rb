class CreateSystems < ActiveRecord::Migration
  def change
    create_table :systems do |t|
      t.string           :name
      t.float            :mass
      t.float            :vmag
      t.string           :visibility
      t.string           :constellation
      t.boolean          :nameable, default: true
      t.timestamps
    end
  end
end
