class Connector < ApplicationRecord
  validates :team_id, presence: true, numericality: true, if: -> {:team_id in steps.first || require_validation}
  validates :investment, presence: true, numericality: true
end
