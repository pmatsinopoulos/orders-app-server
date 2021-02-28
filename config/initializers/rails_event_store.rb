class EventStoreBase < ActiveRecord::Base
  self.abstract_class = true
  connects_to database: { writing: :event_store, reading: :event_store }
end

RailsEventStoreActiveRecord.send(:remove_const, :Event)
RailsEventStoreActiveRecord.send(:remove_const, :EventInStream)

module RailsEventStoreActiveRecord
  class Event < EventStoreBase
    self.primary_key = :id
    self.table_name = 'event_store_events'
  end
  class EventInStream < EventStoreBase
    self.primary_key = :id
    self.table_name = 'event_store_events_in_streams'
    belongs_to :event, primary_key: :event_id
  end
end

Rails.configuration.event_store.subscribe(CreateOrderJob, to: [Events::Commands::CreateOrder.descriptor.name])
# Rails.configuration.event_store.subscribe(->(ev) {
#   puts "ev: #{ev.inspect}"
# }, to: [Events::Commands::CreateOrder.descriptor.name] )
