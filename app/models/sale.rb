class Sale < ApplicationRecord
  belongs_to :agent
  belongs_to :destination

  validates :agent_id, presence: true
  validates :destination_id, presence: true
end
