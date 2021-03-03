module Commands
  class EventsResponder < ApplicationResponder
    def respond(order)
      post_response({
                      event_class: 'Fact',
                      event_type: 'OrderCreated',
                      payload: {
                        id: order.id,
                        code: order.code,
                        product: order.product,
                        price: order.price
                      }
                    })
    end
  end
end
