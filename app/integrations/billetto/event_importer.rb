module Billetto
  class EventImporter
    def initialize(client: Billetto::Client.new)
      @client = client
    end

    def call
      response = @client.events

      response.fetch("data", []).map do |billetto_event|
        import_event(billetto_event)
      end
    end

    private

    def import_event(billetto_event)
      event = Event.find_or_initialize_by(
        external_id: billetto_event.fetch("id")
      )

      event.name = billetto_event.fetch("name")
      event.description = billetto_event["description"]
      event.description_html = billetto_event["description_html"]
      event.image_url = billetto_event["image_url"]
      event.starts_at = billetto_event["starts_at"]
      event.ends_at = billetto_event["ends_at"]
      event.public_url = billetto_event["public_url"]
      event.state = billetto_event["state"]
      event.currency = billetto_event["currency"]

      event.save!

      event
    end
  end
end