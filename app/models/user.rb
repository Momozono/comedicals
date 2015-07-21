class User < ActiveRecord::Base
  has_secure_password
  before_save {self.email = email.downcase}
  before_create :create_remember_token

  validates :name, presence: true, length: {maximum: 20}

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}
  validates :password, length: {minimum: 6, maximum: 20}

  has_many :microposts, dependent: :destroy

  has_many :user_professions
  has_many :professions, through: :user_professions

  has_many :relationships, foreign_key: "follower_id", dependent: :destroy
  has_many :followed_users, through: :relationships, source: :followed #relationshipsテーブルのfollowedカラムから参照していると記載

  has_many :reverse_relationships, foreign_key: "followed_id", class_name: "Relationship", dependent: :destroy
  has_many :followers, through: :reverse_relationships, source: :follower

  def feed
    Micropost.where("user_id = ?", id)
  end

  def follow!(followed_user)
    self.relationships.create!(followed_id: followed_user.id)
  end

  def unfollow!(followed_user)
    self.relationships.find_by(followed_id: followed_user.id).destroy
  end

  def following?(followed_user)
    self.relationships.find_by(followed_id: followed_user.id)
  end

  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  private
    def create_remember_token
      self.remember_token = User.encrypt(User.new_remember_token)
    end
end


