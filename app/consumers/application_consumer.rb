# frozen_string_literal: true

# Application consumer from which all Karafka consumers should inherit
# You can rename it if it would conflict with your current code base (in case you're integrating
# Karafka with other frameworks)
class ApplicationConsumer < Karafka::BaseConsumer
  def send_response_with(object)
    class_name_of_responder = self.class.name.gsub('Consumer', 'Responder').constantize
    class_name_of_responder.new.respond(object)
  end
end

