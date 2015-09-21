class Image < ActiveRecord::Base
  has_many :image_ideas
  has_many :ideas, through: :image_ideas
  has_attached_file :image, styles: { small: "64x64", med: "100x100", large: "200x200" }
end
