class User < ActiveRecord::Base
	before_save {self.email = email.downcase}

	has_secure_password

	validates :name, presence: true, length: {maximum: 20}

	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}
end
#Userモデルのバリデーションuniqueness実装途中

