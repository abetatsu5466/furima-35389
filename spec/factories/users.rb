FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password = password{ '1a' + Faker::Internet.password(min_length: 6 }
    password {password}
    password_confirmation {password}
    last_name {"漢字"}
    first_name {"ひらがな"}
    last_name_kana {"カナ"} 
    first_name_kana {"カタ"} 
    birth_date {"1990-01-01"}
  end
end

