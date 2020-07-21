class Review < ApplicationRecord
  belongs_to :user
  belongs_to :repply_id, class_name: User.name
  belongs_to :review_type, polymorphic: true
end
