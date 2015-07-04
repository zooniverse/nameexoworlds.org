class Settings
  def self.login_visible?
    ENV["APP_LOGIN_VISIBLE"] == 'true'
  end
end
