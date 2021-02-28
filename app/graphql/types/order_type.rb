module Types
  class OrderType < Types::BaseObject
    field :id, Integer, null: false
    field :code, String, null: false
    field :product, String, null: false
    field :price, Float, null: false
  end
end
