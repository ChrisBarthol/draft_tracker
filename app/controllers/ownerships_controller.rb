class OwnershipsController < ApplicationController
  helper_method :sort_column, :sort_direction

  def create
    @ownership = Ownership.new(owner_params)
    if @ownership.save
      redirect_to draft_path
    end
  end

  private
    def owner_params
      params.require(:ownership).permit(:order_id, :player_id, :team_id)
    end

    def sort_column  
        Ownership.column_names.include?(params[:sort]) ? params[:sort] : "name"
    end

    def sort_direction
      %w[asc desc].include?(params[:direction]) ?  params[:direction] : "asc"
    end
end