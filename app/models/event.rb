class Event < ApplicationRecord
  has_one :event_vote_count

  validates :external_id, presence: true, uniqueness: true
  validates :name, presence: true

  def vote_count
    EventVoteCount.find_by(event_id: id)&.upvotes.to_i - EventVoteCount.find_by(event_id: id)&.downvotes.to_i
  end

  def upvotes
    EventVoteCount.find_by(event_id: id)&.upvotes.to_i
  end

  def downvotes
    EventVoteCount.find_by(event_id: id)&.downvotes.to_i
  end
end
