FactoryGirl.define do
  factory :user do
    username
    password 'password'
    role 0


    factory :admin do
      role 1
    end
  end

  sequence :username do |n|
    "Doug #{n}"
  end
end
