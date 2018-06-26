class Investment < ApplicationRecord
  validates :team_id, presence: true, numericality: true
  validates :investment, presence: true, numericality: true
end
