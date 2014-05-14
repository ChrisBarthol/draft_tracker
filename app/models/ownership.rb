class Ownership < ActiveRecord::Base
	belongs_to :player
	belongs_to :team
	belongs_to :order

	validates :player, presence: true
	validates :team, presence: true
	validates :order, presence: true

end
