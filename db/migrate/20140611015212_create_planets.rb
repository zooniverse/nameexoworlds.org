class CreatePlanets < ActiveRecord::Migration
  def change
    create_table :planets do |t|
      t.text             :description
      t.float            :mass
      t.float            :radius
      t.float            :semi_major
      t.float            :period
      t.float            :designation
      t.integer          :top_vote
      t.string           :top_vote_name
      t.float            :total_votes
      t.integer          :system_id
      t.string           :discovery_method
      t.datetime         :discovery_date
      t.datetime         :discovery_survey
      t.string           :image_url
      t.string           :state, :default => 'pending'

      t.timestamps
    end
  end
end
