class Idea < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  validates :user_id, presence: true
  validates :category_id, presence: true

  has_many :image_ideas
  has_many :images, through: :image_ideas
end
