FactoryGirl.define do

  factory :category do
    name
  end

  factory :user do
    username
    password 'password'
    role 1


    factory :admin do
      role 2
    end

    factory :guest do
      role 0
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
