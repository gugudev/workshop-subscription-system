FactoryBot.define do
  factory :workshop do
    name { FFaker::Name.name }
    short_description  { FFaker::Lorem.sentence }
    full_description { FFaker::Lorem.paragraph(10) }
    attendees { Random.rand(1..100) }
    duration { Random.rand(1..100)  }
    workshop_date { FFaker::Time.date }
    start_time { FFaker::Time.datetime }
  end
end
