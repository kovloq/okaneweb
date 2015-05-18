class Transaction < ActiveRecord::Base
	# attr_accessible :transaction_name, :category,:value, :created_by,:updated_by,:deleted_flag 
	belongs_to :user

	def self.coba
		return Transaction.first
	end
end
