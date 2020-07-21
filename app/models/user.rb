class User < ApplicationRecord
  has_one :user_contact, dependent: :destroy
  has_many :blogs,  dependent: :destroy
  has_many :tours,  dependent: :destroy
  has_many :reviews, dependent: :destroy
end
