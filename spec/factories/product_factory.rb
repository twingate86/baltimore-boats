FactoryBot.define do
  factory :product do
    name { "Product1" }
    description { "test product" }
    colour { "red" }
    price { "100" }
    image_url { "row-boat.jpg" }
  end
end