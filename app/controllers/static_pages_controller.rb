class StaticPagesController < ApplicationController
  def home
  end

  def help
  end

  def live
  end

  def draft
    @players = Player.undrafted.map{ |player| [player.name, player.id] }
    @order = Order.next.first
    @team = Team.find_by_id(@order.team_id)
  end

  def results
  end
end
