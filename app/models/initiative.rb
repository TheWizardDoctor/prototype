class Initiative < ApplicationRecord
  belongs_to :roadmap, optional: true
end
