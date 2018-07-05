class Feature < ApplicationRecord
  belongs_to :initiative
  validates :name,  presence: true
  validates :description,  presence: true
  validates :quater, presence: true
  #validates :team_type
  #validates :primary_team_id
  #validates :owner
  #validates :scope
end
