class TourDetail < ApplicationRecord
  belongs_to :tour, optional: true

  enum status: {watting: 0, done: 1, cancel: 2}
end
