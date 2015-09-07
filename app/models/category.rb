class Category < ActiveRecord::Base
	# has_many :transaction
	has_one :transaksi, class_name: "Transaction"
	has_one :income
	has_one :expense
end
