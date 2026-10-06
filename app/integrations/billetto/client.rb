require "uri"
require "net/http"
require "json"

module Billetto
  class Client
    BASE_URL = "https://billetto.dk/api/v3".freeze

    def initialize(api_key: ENV["BILLETTO_API_KEY"], api_secret: ENV["BILLETTO_API_SECRET"])
      @api_key = api_key
      @api_secret = api_secret
    end

    def events
      get("/organiser/events")
    end

    private

    def get(path)
      url = URI("#{BASE_URL}#{path}")

      http = Net::HTTP.new(url.host, url.port)
      http.use_ssl = true

      request = Net::HTTP::Get.new(url)
      request["accept"] = "application/json"
      request["Api-Keypair"] = @api_key + ":" + @api_secret
      response = http.request(request)

      unless response.is_a?(Net::HTTPSuccess)
        raise "Billetto API request failed: #{response.code}"
      end

      JSON.parse(response.body)
    end
  end
end