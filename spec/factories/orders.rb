FactoryBot.define do
  factory :order do
    code { SecureRandom.hex }
  end
end
