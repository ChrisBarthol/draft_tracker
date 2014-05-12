class Ownership < ActiveRecord::Base
	belongs_to :player
	belongs_to :team
	belongs_to :order

	validates :player, presence: true
	validates :team, presence: true
	validates :order, presence: true

	scope :results_by_round, -> { joins(:order).group_by(&:round) }
	scope :results_by_team, -> { joins(:team).group_by(&:team) }
end
