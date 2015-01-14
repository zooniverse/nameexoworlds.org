class Club < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :cas_authenticatable
  has_many :propsed_names
  has_many :system_votes

  def cas_extra_attributes=(extra_attributes)
    puts "EXTA ATTRIBUTES"
    puts extra_attributes
    extra_attributes.each do |name, value|
      case name.to_sym
      when :username
        self.username = value
      when :email
        self.email = value
      when :can_vote
        self.can_vote = value
      end

    end
  end

  def email_required?
    false
  end

  def email_changed?
    false
  end

  def votes_remaining
    vote_limit - system_votes.count
  end

  def has_reached_vote_limit?
    system_votes.count >= vote_limit
  end

  def vote_limit
    20
  end

end
