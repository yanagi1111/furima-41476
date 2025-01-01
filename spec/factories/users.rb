FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.email }
    password              { 'a1' + Faker::Internet.password(min_length: 6) }
    password_confirmation { password }

    japanese_user = Gimei.name
    last_name             { japanese_user.last.kanji }
    first_name            { japanese_user.first.kanji }
    last_name_kana        { japanese_user.last.katakana }
    first_name_kana       { japanese_user.first.katakana }

    birthday              { Faker::Date.birthday }
  end
end
