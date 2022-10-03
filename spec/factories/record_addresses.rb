FactoryBot.define do
  factory :record_address do
   
   post_code      {'123-1234'}
   area_id        {'2'}
   municipalities {'横浜'}
   adress         {'青山'}
   building_name  {'あ'}
   phone_number   {'09012345678'}
   token          {'aaaa'}


  end
end
