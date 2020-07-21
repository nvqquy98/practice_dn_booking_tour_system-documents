class Tour < ApplicationRecord
  belongs_to :category, optional: true
  has_many :books, dependent: :destroy
  has_many :tags, as: :tag_type, dependent: :destroy
  has_many :tour_details, dependent: :destroy
  has_many :reviews, as: :review_type, dependent: :destroy
  has_many :images, as: :image_type, dependent: :destroy

  # Ex:- scope :active, -> {where(:active => true)}
end
