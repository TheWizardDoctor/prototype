class Team < ApplicationRecord
  belongs_to :feature
  validates :name,  presence: true
  validates :description,  presence: true
end
