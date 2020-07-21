class Review < ApplicationRecord
  belongs_to :user, optional: true
  has_many :repplys, class_name: Review.name, foreign_key: :repply_id, dependent: :destroy
  belongs_to :review_type, polymorphic: true
end
