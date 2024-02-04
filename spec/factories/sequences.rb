FactoryBot.define do
  sequence :email do |n|
    "fakeemail#{n}@factory.com"
  end

  sequence :name do |n|
    "fakename_#{n}"
  end
end