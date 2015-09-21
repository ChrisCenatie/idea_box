class Category < ActiveRecord::Base
  has_many :ideas
  validates :category, uniqueness: true
end
