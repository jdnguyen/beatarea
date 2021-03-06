FactoryGirl.define do
  factory :event do
    location_name "Pacha"
    location_address "618 W 46th St, New York, NY 10036"
    start_time 10.days.from_now
  end

  factory :artist do
    name "Adventure Club"
  end

  factory :genre do
    name "dubstep"
  end

  factory :user do
    name "john nguyen"
    email "jdnguyenxo@gmail.com"
  end
end