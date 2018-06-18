class Team < ApplicationRecord
  belongs_to :feature, optional: true

end
