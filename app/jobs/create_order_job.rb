class CreateOrderJob < ActiveJob::Base
  def perform(payload)
    event = EventStore.event_store.deserialize(payload)

    puts "****************************** Creating Order *************************"
    Order.create! code: event.data.code
  end
end
