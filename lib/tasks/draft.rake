require 'csv'
require 'rubygems'
require 'capybara'
require 'capybara/dsl'

include Capybara::DSL

Capybara.run_server = true
Capybara.current_driver = :selenium
Capybara.app_host = 'localhost:3000'

Data = "#{Rails.root}/db"

namespace :draft do   
	desc "Fill the database with provided data"
	task populate: :environment do
		Rake::Task["db:reset"].execute
		make_players
		make_teams
		make_order
	end

	def make_players
		CSV.foreach("#{Data}/players.csv", headers: true) do |row|
			Player.new(name: row["Player Name"].strip, position: row["Position"].strip).save!
		end
	end

	def make_teams
		CSV.foreach("#{Data}/teams.csv", headers: true) do |row|
			Team.new(name: row["Team Name"].strip, division: row["Division"].strip).save!
		end
	end

	def make_order
		CSV.foreach("#{Data}/order.csv", headers: true) do |row|
			name = row["Team Name"].strip
			name.gsub!(/(NY)/, "New York") if name.match(/(NY)/)
			team = Team.find_by_name(name)
			Order.new(round: row["Round"].strip, pick: row["Pick"].strip, team_id: team.id).save!
		end
	end

	task dodraft: :environment do
		visit '/draft'
		click_link 'Draft'
		while Order.next.first != nil do
			click_button 'Draft Player'
		end
		click_link 'Results'
		sleep 100 #see results for 100 seconds
	end
end