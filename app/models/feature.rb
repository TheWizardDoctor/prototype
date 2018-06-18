class Feature < ApplicationRecord
  belongs_to :initiative, optional: true
end
