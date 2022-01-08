class Garment < ApplicationRecord
  belongs_to :garment_type

  scope :set_by_temperature, ->(temp) do
    suitable_garments =
      Garment.
        where(':temp BETWEEN min_temp AND max_temp', temp: temp).
        order('RANDOM()').
        to_sql

    Garment.
      select('DISTINCT ON (garment_type_id) *').
      from("(#{suitable_garments}) AS garments")
  end

  validates :name, presence: true, uniqueness: true
  validates :min_temp, numericality: true
  validates :max_temp, numericality: { greater_than: :min_temp }, if: -> { min_temp.present? }
end
