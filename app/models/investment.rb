class Investment < ApplicationRecord
  validate :team_exists
  validate :team_taken
  validates :team_id, presence: true, numericality: true
  validates :investment, presence: true, numericality: true
  validates :feature_id, presence: true, numericality: true

  private
   def team_exists
     teams = []
     Team.where.not(id: nil).each {|i| teams.push(i.id)}
     (teams.exclude? team_id) ? errors.add(:team_id, "does not exist") : a = 0
   end

   def team_taken
     teams1 = []
     Investment.where(feature_id: feature_id).each {|i| teams1.push(i.team_id)}
     (teams1.include? team_id) ? errors.add(:team_id, "already in feature") : a = 0
   end
end
