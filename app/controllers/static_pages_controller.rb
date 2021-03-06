class StaticPagesController < ApplicationController
  helper_method :sort_column, :sort_direction

  def home
  end

  def help
  end

  def live
    @order = Order.next.first
    @team = Team.find_by_id(@order.team_id) if @order != nil
    @latest = Player.last_three
  end

  def draft
    @players = Player.undrafted.map{ |player| [player.name, player.id] }
    @order = Order.next.first
    @team = Team.find_by_id(@order.team_id) if @order != nil  
  end

  def results
    @team = Team.all.map(&:name)
    if params[:input].nil?
      #if :input is nil then it is an order all 
      @ownerships = Ownership.order(sort_column + ' ' + sort_direction)
    else
      if params[:input].length > 2
        #if input is not a number then it is a team
        team = Team.find_by_name(sanitize_input)
        @ownerships = Ownership.where(team_id: team.id)
      else
        #find all orders with :input of round
        round = Order.where(round: sanitize_input)
        @ownerships = Array.new
        round.each do |round|
          @ownerships += Ownership.where(order_id: round.id)
        end
      end    
    end
  end

  private
    def sanitize_input
      #santize input such that it is only a team name or 1-7
      input = Team.all.map(&:name)
      input+= %w[1 2 3 4 5 6 7]
      input.include?(params[:input]) ? params[:input] : nil
    end

    def sort_column 
      #sanitize params to make sure :sort is a ownership column name
      Ownership.column_names.include?(params[:sort]) ? params[:sort] : "order_id"
    end

    def sort_direction
      #sanitize params to make sure :direction is asc or desc
      %w[asc desc].include?(params[:direction]) ?  params[:direction] : "asc"
    end
end
