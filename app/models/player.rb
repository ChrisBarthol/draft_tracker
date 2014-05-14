class Player < ActiveRecord::Base
	has_one :ownership
	has_one :team, through: :ownership

	validates :name, presence: true
	validates :position, presence: true

	scope :drafted, -> { joins(:ownership).where(players: {id: Ownership.all.map(&:player_id)}) }
	scope :undrafted, -> { where.not(id: Ownership.all.map(&:player_id)) }
	scope :by_position, -> { order('position ASC, name ASC').undrafted }
	scope :last_three, -> { drafted.order('order_id DESC').limit(3) }
end
