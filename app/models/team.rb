class Team < ApplicationRecord
  validates :name,  presence: true
  validates :description,  presence: true

  def self.search(search)
    where("id LIKE ? OR name LIKE ?", "%#{search}%", "%#{search}%") 
  end

end
