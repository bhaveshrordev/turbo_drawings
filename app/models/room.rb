class Room < ApplicationRecord
  has_one_attached :image

  validates :name, presence: true
  validates :image, attached: true, content_type: ['image/png', 'image/jpg', 'image/jpeg']
end
