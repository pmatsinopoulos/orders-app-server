FactoryBot.define do
  factory :order do
    code { SecureRandom.hex }
    product { SecureRandom.hex }
    price { 10.0 }
  end
end
