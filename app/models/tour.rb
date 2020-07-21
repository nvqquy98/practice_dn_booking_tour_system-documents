class Tour < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :books, dependent: :destroy
  has_many :tags, as: :tag_type, dependent: :destroy
  belongs_to :tour_details, dependent: :destroy
  has_many :reviews, as: :review_type, dependent: :destroy
  has_many :images, as: :image_type, dependent: :destroy
end
