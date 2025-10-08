FactoryBot.define do
  factory :address do
    postal_code   { '123-4567' }   
    prefecture_id { 1 }            
    city          { 'Shibuya-ku' } 
    house_number  { '1-1-1' }      
    building_name { 'Test Mansion' }
    phone_number  { '09012345678' } 
    association :order              
    end
end
