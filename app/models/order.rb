class Order < ActiveRecord::Base
	belongs_to :team
	has_one :ownership

	validates :round, presence: true
	validates :pick, presence: true
end
