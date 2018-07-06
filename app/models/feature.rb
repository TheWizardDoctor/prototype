class Feature < ApplicationRecord
  belongs_to :initiative
  validates :name,  presence: true
  validates :description,  presence: true
  validates :quater, presence: true

  def self.search(search)
    where("id LIKE ? OR name LIKE ? OR description LIKE ? OR initiative_id LIKE ? OR quater LIKE ? OR primary_team_id LIKE ?", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%") 
  end

end
