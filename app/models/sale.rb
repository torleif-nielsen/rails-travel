class Sale < ApplicationRecord
  belongs_to :agent
  belongs_to :destination
end
