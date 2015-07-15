FactoryGirl.define do
  factory :user do
    first_name "John"
    last_name  "Doe"
    email "demo@demo.com"
    password "12345678"
    admin false
    confirmed_at Date.today
  end
  factory :product do
    name "bike"
    description "cool bycicle"
    image_url "bike.jpg"
    colour "red"
    price "2,99" 
  end
  factory :comment do
    body "comment's body"
    rating 3 
    association :user, factory: :user
    association :product, factory: :product
  end
  factory :order do
    association :user, factory: :user
  end
end