class Feature < ApplicationRecord
  belongs_to :initiative
  validates :name,  presence: true
  validates :description,  presence: true
  validates :quarter, presence: true

end
