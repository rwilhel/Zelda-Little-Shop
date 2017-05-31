FactoryGirl.define do

  factory :category do
    name
  end

  factory :user do
    username
    password 'password'
    role 0


    factory :admin do
      role 1
    end
  end

  sequence :name do |n|
    "Category #{n}"
  end

  sequence :username do |n|
    "Doug #{n}"
  end

  sequence :email do |n|
    "Doug#{n}@example.com"
  end
end
