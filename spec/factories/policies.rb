FactoryBot.define do
   factory :policy do
     name {Faker::Name.unique.name}
     company_id { 1 }
   end
end
