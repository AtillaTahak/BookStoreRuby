FactoryBot.define do
	factory :book do
	  title { Faker::Book.title }
	  author { Faker::Book.author }
	  price { Faker::Number.decimal(l_digits: 2) }
	  description { Faker::Lorem.paragraph }
	  image_url { Faker::Internet.url }
	end
  end
