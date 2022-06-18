class Animal < ApplicationRecord
  has_many :sightings

  validates :common_name, :latin_name, uniqueness: true
  validates :common_name, :latin_name, presence: true
end
