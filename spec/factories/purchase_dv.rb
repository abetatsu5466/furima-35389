FactoryBot.define do
    factory :purchase_dv do
      postal_code { '123-4567' }
      prefecture_id { 1 }
      address { '東京都' }
      house_number { '1-1' }
      building_name { '東京ハイツ' }
      phone_number { '01234567891' }
      end
  
end

