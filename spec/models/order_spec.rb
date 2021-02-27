RSpec.describe Order do
  it 'requires a code' do
    order = build :order, code: nil

    expect(order.save).to eq(false)
    expect(order.errors[:code]).to include("can't be blank")
  end
end
