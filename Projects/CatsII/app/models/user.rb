class User < ActiveRecord::Base
  has_many :cats
  :user_name, :password_digest, presence: true
  after_initialize :ensure_session_token

  validates :password_digest, presence: true

  validates(
    :password,
    length: {minimum: 6, allow_nil: true})

  validates :session_tokekn, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true

  def self.find_by_credentials(username,password)
    user=User.find_by(username: username)
    return nil if user.nil?
    user.is_password?(password) ? user : nil
  end

  def owns_cat?(cat)
    cat.user_id == self.id
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def password=(password)
    @password=password
    self.password_digest = BCrypt::Password.create(password)
  end

  def reset_session_token!
    self.session_token = SecureRandom.urlsafe_base64(16)
    self.save!
    self.session_token
  end

  private

  def ensure_session_token
    self.session_token ||= SecureRandom.urlsafe_base64(16)
  end
end
