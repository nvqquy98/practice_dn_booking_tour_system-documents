class Blog < ApplicationRecord
  belongs_to :user
  has_many :tags, as: :tag_type, dependent: :destroy
  has_many :reviews, as: :review_type, dependent: :destroy
  has_many :images, as: :image_type, dependent: :destroy
end
