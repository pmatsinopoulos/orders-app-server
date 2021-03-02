class EventsConsumer < ApplicationConsumer
  private

  def consume
    order = Order.create! params.payload['data'].merge(code: params.payload['event_id'])
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
