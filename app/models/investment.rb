class Investment < ApplicationRecord
  validate :team_exists
  #validate :team_taken #REVIEW currently, if this is activated then when an investment is changed, it raises an error (SOMETHING WITH :BEFORE_VALIDATION MIGHT HELP)
  validates :team_id, presence: true, numericality: true
  validates :investment, presence: true, numericality: true
  validates :feature_id, presence: true, numericality: true

  private
  #this is to make sure that the team entered is real and wont cause a big bad database error
   def team_exists
     teams = []
     Team.where.not(id: nil).each {|i| teams.push(i.id)}
     (teams.exclude? team_id) ? errors.add(:team_id, "does not exist") : a = 0
   end

   #this is to make sure that the team isnt already in the feature #REVIEW AND IS CURRENTLY BROKEN
   def team_taken
     teams1 = []
     Investment.where(feature_id: feature_id).each {|i| teams1.push(i.team_id)}
     (teams1.include? team_id) ? errors.add(:team_id, "already in feature") : a = 0
   end
end
