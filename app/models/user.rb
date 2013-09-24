class User < ActiveRecord::Base
  before_save {self.email.downcase!}
  validates :name, :email, presence: true
  validates :name, length: {maximum: 50}
  VALID_EMAIL_REGEX =  /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :email, format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}
  validates :password, length: {minimum: 6}
  has_secure_password
end
