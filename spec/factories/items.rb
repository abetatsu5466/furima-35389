FactoryBot.define do
  factory :item do
     association :user
     title {"雨"}
     details {"雪"}
     category_id {1}
     status_id {2}
     cost_id  {2}
     prefecture_id {2}
     delivery_day_id {2}
     price {300}


     after(:build) do |item|
      item.image.attach(io: File.open('app/assets/images/furima-logo-color.png'), filename: 'furima-logo-corol.png')
     end
   end
end
