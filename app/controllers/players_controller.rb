class PlayersController < ApplicationController
	def undrafted
		if params[:input].nil?
			@undrafted = Player.by_position
		else
			@undrafted = Player.by_position.where(position: sanitize_position_input)
		end
	end

	def drafted
		redirect_to results_path
	end

	private
		def sanitize_position_input
			input = Player.all.map{ |player| player.position}
			input.include?(params[:input]) ? params[:input] : nil
		end

end