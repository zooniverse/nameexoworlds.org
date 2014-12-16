class CreatePlanets < ActiveRecord::Migration
  def change
    create_table :planets do |t|
      t.text             :name
      t.float            :mass_jup
      t.float            :mass_earth
      t.float            :semi_major
      t.float            :period

      t.integer          :top_vote
      t.string           :top_vote_name
      t.float            :total_votes
      t.integer          :system_id
      t.integer          :discovery_year
      t.string           :image_url
      t.string           :state, :default => 'pending'
      t.boolean          :nameable, :default => true

      t.timestamps
    end
  end
end
