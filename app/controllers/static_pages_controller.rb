class StaticPagesController < ApplicationController
  helper_method :sort_column, :sort_direction

  def home
  end

  def help
  end

  def live
    @order = Order.next.first
    @team = Team.find_by_id(@order.team_id)
    @latest = Player.last_three
  end

  def draft
    @players = Player.undrafted.map{ |player| [player.name, player.id] }
    @order = Order.next.first
    @team = Team.find_by_id(@order.team_id)
  end

  def results
    @team = Team.all.map(&:name)
    if params[:input].nil?
      @ownerships = Ownership.order(sort_column + ' ' + sort_direction)
    else
      if params[:input].length > 2
        team = Team.find_by_name(sanitize_input)
        @ownerships = Ownership.where(team_id: team.id) #team
      else
        round = Order.where(round: sanitize_input)
        @ownerships = Array.new
        round.each do |round|
          @ownerships += Ownership.where(order_id: round.id) #round
        end
      end    
    end
  end

  private
    def sanitize_input
      input = Team.all.map(&:name)
      input+= %w[1 2 3 4 5 6]
      input.include?(params[:input]) ? params[:input] : nil
    end

    def sort_column 
      Ownership.column_names.include?(params[:sort]) ? params[:sort] : "order_id"
    end

    def sort_direction
      %w[asc desc].include?(params[:direction]) ?  params[:direction] : "asc"
    end
end
