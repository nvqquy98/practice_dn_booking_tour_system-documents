class User < ApplicationRecord
  has_one :user_contact, dependent: :destroy
  has_many :blogs, dependent: :destroy
  has_many :tours, dependent: :destroy
  has_many :reviews, class_name: Review.name, foreign_key: :user_id,
                                              dependent: :destroy
  has_many :reviews, class_name: Review.name, foreign_key: :repply_id,
                                              dependent: :destroy
end
