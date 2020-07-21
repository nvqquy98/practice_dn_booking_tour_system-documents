class Category < ApplicationRecord
  has_many :tours, dependent: :destroy

  enum area: {international: 1, national: 0}

  scope :get_home, ->{order("created_at")}
  scope :find_area, ->(area){where(area: area)}
end
