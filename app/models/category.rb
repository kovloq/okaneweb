class Category < ActiveRecord::Base
	has_many :income
	has_many :expense
end
