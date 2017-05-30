FactoryGirl.define do

  factory :category do
    name
  end

  factory :user do
    username
    email
    password 'password'

    factory :admin do
      role 1
    end

    factory :guest do
      role 2
    end
  end

  sequence :name do |n|
    "Category #{n}"
  end

  sequence :username do |n|
    "Chantal #{n}"
  end

  sequence :email do |n|
    "chantal#{n}@example.com"
  end
end
