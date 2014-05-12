class Order < ActiveRecord::Base
	belongs_to :team
	has_one :ownership

	validates :round, presence: true
	validates :pick, presence: true

	#scope :next, -> { joins(:ownership).where.not(orders: {id: Ownership.all.map(&:order_id)}).first }
	scope :next, -> { where('id NOT IN (?)', Ownership.all.map(&:order_id))}
end
