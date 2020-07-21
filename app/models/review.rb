class Review < ApplicationRecord
  belongs_to :user_id
  has_many :repply, class_name: Review.name, foreign_key: :repply_id, dependent: :destroy
  belongs_to :review_type, polymorphic: true
end
