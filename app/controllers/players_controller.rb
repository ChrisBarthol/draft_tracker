class PlayersController < ApplicationController
	def undrafted
		@undrafted = Player.by_position
	end

	def drafted
		@drafted = Player.drafted
	end
end