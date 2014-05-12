class Player < ActiveRecord::Base
	has_one :ownership
	has_one :team, through: :ownerships

	validates :name, presence: true
end
