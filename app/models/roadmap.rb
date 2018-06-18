class Roadmap < ApplicationRecord
  has_many :initiatives
  validates :name,  presence: true
  validates :description,  presence: true
end
