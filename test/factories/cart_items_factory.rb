FactoryBot.define do
	factory :cart_item do
	  user
	  book
	  quantity { Faker::Number.number(digits: 1) }
	end
end
