FactoryGirl.define do

  factory :item do
    name
    description
    price 4
    category_id 1
  end

  sequence :name do |n|
    "Red Potion #{n}"
  end

  sequence :description do |n|
    "Heals the body #{n}"
  end
end
