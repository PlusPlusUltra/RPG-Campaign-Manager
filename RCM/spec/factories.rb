FactoryGirl.define do
  factory :event do
    start_day 1
    start_month 1
    start_year 1
    start_hour 1
    start_minute 1
    end_day 1
    end_month 1
    end_year 1
    end_hour 1
    end_minute 1
  end
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
