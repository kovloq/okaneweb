class Transaction < ActiveRecord::Base
	# attr_accessible :transaction_name, :category,:value, :created_by,:updated_by,:deleted_flag 
	
	belongs_to :category
	validates :name, presence: true
	validates :category_id, presence: true
	validates :date, presence: true
	validates :description, presence: true
end
