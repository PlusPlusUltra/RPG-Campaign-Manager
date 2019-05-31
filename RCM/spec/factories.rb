FactoryGirl.define do
  factory :user do
    id                    "2"
    username              "test"
    email                 "test@test.it"
    password              "password"
    password_confirmation "password"
    admin                 "false"
  end

  factory :campaign do
    title "test"
    description "test"
    user_id "2"
    master "test"
  end
end
