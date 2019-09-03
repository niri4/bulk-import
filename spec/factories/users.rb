FactoryBot.define do
   factory :user do
     name { Faker::Name.name }
     email { Faker::Internet.email }
     password { 'asdfasdf' }
     password_confirmation { 'asdfasdf' }
   end
end
