# frozen_string_literal: true

class ApplicationResponder < Karafka::BaseResponder
  def post_response(data)
    request = Typhoeus::Request.new(
      'http://localhost:3002/events',
      method: :post,
      body: ActiveSupport::JSON.encode(data),
      headers: {
        Accept: 'application/json',
        'Content-Type': 'application/json'
      }
    )
    request.run
  end
end
