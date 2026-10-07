module Voting
  module Handlers
    class VoteCountHandler
      def call(event)
        record = EventVoteCount.find_or_create_by(event_id: event.data[:event_id])

        case event
        when Events::EventUpvoted
          record.increment!(:upvotes)
        when Events::EventDownvoted
          record.increment!(:downvotes)
        end
      end
    end
  end
end