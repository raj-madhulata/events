class EventVote < ApplicationRecord
  belongs_to :event

  validates :voter_id, presence: true, uniqueness: { scope: :event_id }
  validates :value, inclusion: { in: [-1, 1] }
end
