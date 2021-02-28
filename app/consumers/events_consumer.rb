class EventsConsumer < ApplicationConsumer
  private

  def consume
    Order.create! params.payload['data'].merge(code: params.payload['event_id'])
  rescue => ex
    Rails.logger.error(ex)
  end
end
