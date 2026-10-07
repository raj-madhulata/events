Rails.configuration.event_store = RailsEventStore::Client.new(
  repository: RubyEventStore::ActiveRecord::EventRepository.new(
    serializer: RubyEventStore::NULL
  )
)