module Voting
  module Commands
    class VoteOnEvent
      attr_reader :event_id, :user_id, :value

      def initialize(event_id:, user_id:, value:)
        @event_id = event_id
        @user_id  = user_id
        @value    = value # 1 = upvote, -1 = downvote
      end
    end
  end
end