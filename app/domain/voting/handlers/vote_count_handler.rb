module Voting
  module Handlers
    class VoteCountHandler
      def call(event)
        record = EventVoteCount.find_or_create_by(event_id: event.data[:event_id])

        case event.data[:event_type]
        when "upvote"
          record.increment!(:upvotes)
        when "downvote"
          record.increment!(:downvotes)
        end
      end
    end
  end
end