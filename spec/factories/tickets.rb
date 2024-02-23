FactoryBot.define do
  factory :ticket do
    name
    phone {"31301234123"}

    trait :region do
      region_id { create(:region).id }
    end

    trait :resource_category do
      resource_category_id { create(:resource_category).id }
    end

    trait :organization do
      organization_id { create(:organization).id }
    end

  end
end