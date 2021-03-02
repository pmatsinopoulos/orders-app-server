class ApplicationMessagesChannel < ApplicationCable::Channel
  def subscribed
    Rails.logger.debug('ApplicationMessagesChannel: subscribed: done')
    stream_from('application_messages')
  end
end
