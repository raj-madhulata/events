class ImportEventsJob < ApplicationJob
  queue_as :default

  retry_on StandardError, wait: :polynomially_longer, attempts: 3

  def perform
    Billetto::EventImporter.new.call
  end
end
