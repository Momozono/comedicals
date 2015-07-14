class Profession < ActiveRecord::Base
  has_many :user_professions
  has_many :users, through: :user_professions
end
