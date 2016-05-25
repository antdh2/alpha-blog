class Article < ActiveRecord::Base
  belongs_to :user
  # has many article categories
  has_many :article_categories
  # has many cetegories
  has_many :categories, through: :article_categories
  
  # rails auto creates getters and setters for articles table columns
  # add validations in the model layer, make sure title is present or DO NOT save
  validates :title, presence: true, length: { minimum: 3, maximum: 50 }
  validates :description, presence: true, length: { minimum: 10, maximum: 300 }
  # validate an article has a user attached
  validates :user_id, presence: true
end