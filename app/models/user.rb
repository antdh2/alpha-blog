class User < ActiveRecord::Base
  # db relationships
  has_many :articles
  # before saving user object to db, convert to lowercase
  before_save { self.email = email.downcase }
  
  validates :username, presence: true,
            uniqueness: { case_sensitive: false }, 
            length: {minimum: 3, maximum: 25}
            
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
            length: {maximum: 105 },
            uniqueness: { case_sensitive: false },
            format: {with: VALID_EMAIL_REGEX }
            
  # for passwords
  has_secure_password
end