module Commands
  class EventsConsumer < ApplicationConsumer
    private

    def consume
      order = Order.create!(params.payload['data'].merge(code: params.payload['event_id']))
      send_response_with(order)
    rescue => ex
      Rails.logger.error(ex)
    end
  end
end
