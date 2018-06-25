class Feature < ApplicationRecord
  belongs_to :initiative
  validates :name,  presence: true
  validates :description,  presence: true

end
