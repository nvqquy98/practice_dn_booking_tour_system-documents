class Tag < ApplicationRecord
  belongs_to :tag_type, polymorphic: true
end
