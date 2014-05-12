class Team < ActiveRecord::Base
	has_many :ownerships
	has_many :players, through: :ownerships
	has_many :orders

	validates :name, presence: true, uniqueness: { case_sensitive: false }

	def acquire(player)
		players << player
	end
end
