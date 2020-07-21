class Book < ApplicationRecord
  belongs_to :user_contact
  belongs_to :tour
end
