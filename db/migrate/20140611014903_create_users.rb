class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string   :location
      t.string   :country
      t.string   :uid
      t.string   :provider
      t.string   :name
      t.string   :email
      t.string   :avatar
      t.string   :oauth_token
      t.datetime :oauth_expires_at
      t.integer  :vote_count, :default => 0
      t.timestamps
    end
  end
end
