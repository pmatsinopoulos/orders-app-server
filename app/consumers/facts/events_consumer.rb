module Facts
  class EventsConsumer < ApplicationConsumer
    private

    def consume
      order_details = params.payload['data']
      ActionCable.server.broadcast(
        'application_messages',
        {
          type: 'ORDER_CREATED',
          order: {
            id: order_details['id'],
            code: order_details['code'],
            product: order_details['product'],
            price: order_details['price']
         }
        }
      )
    rescue => ex
      Rails.logger.error(ex)
    end
  end
end
