class PlayersController < ApplicationController
	def undrafted
		if params[:input].nil?
			#if no input then render all undrafted players by position
			@undrafted = Player.by_position
		else
			#sort by input
			@undrafted = Player.by_position.where(position: sanitize_position_input)
		end
	end

	def drafted
		redirect_to results_path
	end

	private
		def sanitize_position_input
			#sanitize input to only allow position strings
			input = Player.all.map{ |player| player.position}
			input.include?(params[:input]) ? params[:input] : nil
		end

end