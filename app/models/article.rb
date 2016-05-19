class Article < ActiveRecord::Base
  # rails auto creates getters and setters for articles table columns
  # add validations in the model layer, make sure title is present or DO NOT save
  validates :title, presence: true, length: { minimum: 3, maximum: 50 }
  validates :description, presence: true, length: { minimum: 10, maximum: 300 }
end