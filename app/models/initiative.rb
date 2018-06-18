class Initiative < ApplicationRecord
  belongs_to :roadmap
  validates :name,  presence: true
  validates :description,  presence: true
end
