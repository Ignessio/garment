class GarmentType < ApplicationRecord
  has_many :garments, dependent: :destroy

  validates :name, presence: true, uniqueness: true
end
