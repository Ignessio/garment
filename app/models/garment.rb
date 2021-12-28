class Garment < ApplicationRecord
  belongs_to :garment_type

  validates :name, presence: true, uniqueness: true
  validates :min_temp, numericality: true
  validates :max_temp, numericality: { greater_than: :min_temp }, if: -> { min_temp.present? }
end
