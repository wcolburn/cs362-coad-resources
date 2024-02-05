FactoryBot.define do
  factory :organization do
    email
    name
    phone {"31301234123"}
    status { "approved" }
    primary_name { "Test" }
    secondary_name { "Org" }
    secondary_phone { "31301234123" }
  end
end