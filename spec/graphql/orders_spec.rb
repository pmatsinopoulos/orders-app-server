RSpec.describe 'GET orders list', type: :request do
  let(:headers) { { } }
  let(:query) {
    <<~STR
      query Orders {
        orders {
          code
          id
          product
          price
        }
      }
    STR
  }

  let(:params) {
    {
      query: query
    }
  }
  let(:get_orders) { get '/graphql', headers: headers, params: params, as: :json }

  before do
    2.times { create :order }
  end

  it 'returns the orders ordered by id' do
    get_orders

    response_decoded = ActiveSupport::JSON.decode(response.body)

    orders_returned = response_decoded['data']['orders']
    expected_orders = ::Order.order(:id).to_a.map { |o| { 'id' => o.id, 'code' => o.code, 'product' => o.product, 'price' => o.price } }

    expect(orders_returned).to match_array(expected_orders)
  end
end
