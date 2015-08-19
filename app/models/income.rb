class Income < ActiveRecord::Base
	belongs_to :category
	validates :name, presence: true
	validates :category_id, presence: true
	validates :date, presence: true
	validates :description, presence: true
end
