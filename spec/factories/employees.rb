FactoryBot.define do
   factory :employee do
     name {Faker::Name.name}
     email { Faker::Internet.unique.email }
     phone { Faker::PhoneNumber }
     parent_id { 1 }
     company_id {1}
   end
end
