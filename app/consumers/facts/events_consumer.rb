module Facts
  class EventsConsumer < ApplicationConsumer
    private

    def consume
      order = Order.find_by_code! params.payload['data']['code']
      ActionCable.server.broadcast(
        'application_messages',
        {
          type: 'NEW_ORDER_CREATED',
          order: {
            id: order.id,
            code: order.code,
            product: order.product,
            price: order.price
         }
        }
      )
    rescue => ex
      Rails.logger.error(ex)
    end
  end
end
