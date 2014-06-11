class User < ActiveRecord::Base
  has_many :votes

  def self.from_omniauth(auth)
    where(auth.slice("provider", "uid")).first || create_from_omniauth(auth)
  end

  def self.create_from_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["info"]["nickname"]
      user.picture = auth["info"]["image"]
      user.oauth_token = auth["credentials"]["token"]
      user.oauth_expires_at = Time.at(auth["credentials"]["expires_at"]) if auth["provider"] == "facebook"
      user.extra = auth
    end
  end

  def populate_from_fb(auth)
  end

  def populate_from_twitter(auth)
  end


  def inc_vote_count
    increment :vote_count
  end

  def dec_vote_count
    decrement :vote_count
  end
end
