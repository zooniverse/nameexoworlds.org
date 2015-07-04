class User < ActiveRecord::Base

  if Rails.env.production?
    devise :omniauthable, omniauth_providers: [:twitter, :facebook]
  else
    devise :omniauthable, omniauth_providers: [:developer, :twitter, :facebook]
  end

  has_many :votes
  has_many :proposal_votes

  def self.find_or_create_from_auth_hash(auth)
    where(auth.slice("provider", "uid")).first || create_from_omniauth(auth)
  end

  def self.create_from_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["info"]["name"]
      user.avatar = auth["info"]["image"]
      user.oauth_token = auth["credentials"]["token"]
      user.oauth_expires_at = Time.at(auth["credentials"]["expires_at"]) if auth["provider"] == "facebook"
      user.extra_info = auth
    end
  end

  def inc_vote_count
    increment :vote_count
  end

  def dec_vote_count
    decrement :vote_count
  end

  def has_voted_for_naming_of_system?(system)
    proposal_votes.where(system: system).present?
  end
end
