class CreateSystems < ActiveRecord::Migration
  def change
    create_table :systems do |t|
      t.float            :ra
      t.float            :dec
      t.string           :star_name
      t.float            :mass
      t.float            :luminosity
      t.float            :radius
      t.string           :star_type
      t.integer          :no_planets
      t.float            :distance
      t.timestamps
    end
  end
end
