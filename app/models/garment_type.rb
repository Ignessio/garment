class GarmentType < ApplicationRecord
  has_many :garments, dependant: :destroy

  validates :name, presence: true, uniqueness: true
end
