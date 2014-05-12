class Player < ActiveRecord::Base
	has_one :ownership
	has_one :team, through: :ownerships

	validates :name, presence: true
	validates :position, presence: true

	scope :drafted, -> { joins(:ownership).where(players: {id: Ownership.all.map(&:player_id)}) }
	scope :undrafted, -> { where('id NOT IN (?)', Ownership.all.map(&:player_id))}
	#scope :undrafted, -> { joins(:ownership).where.not(players: {id: Ownership.all.map(&:player_id)}) }
	#scope :undrafted, -> { find(:all, :conditions => "id NOT IN(#{Ownership.all.map(&:player_id)})") }
	scope :by_position, -> { order('position ASC, name ASC').undrafted.group_by(&:position) }
	scope :last_three, -> { drafted.order('created_at DESC').limit(3) }
end
