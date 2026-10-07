class UpvoteEventHandler
  def call(command)
    stream = "Event$#{command.event_id}"

    existing = Rails.configuration.event_store.read.stream(stream).to_a
    if existing.any? { |e| e.data[:user_id] == command.user_id }
      raise "User already voted"
    end

    Rails.configuration.event_store.publish(
      Events::EventUpvoted.new(
        data: { event_id: command.event_id, user_id: command.user_id }
      ),
      stream_name: stream
    )
  end
end
