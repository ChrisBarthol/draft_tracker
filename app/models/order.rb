class Order < ActiveRecord::Base
	belongs_to :team
	has_one :ownership

	validates :round, presence: true
	validates :pick, presence: true
	validates :team, presence: true

	scope :next, -> { where.not(id: Ownership.all.map(&:order_id)) }

end
