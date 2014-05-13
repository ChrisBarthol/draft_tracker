class OwnershipsController < ApplicationController

  def create
    @ownership = Ownership.new(owner_params)
    begin
      @ownership.save
      redirect_to draft_path
    #rescue if users clicks too fast and tries to add the same record twice
    rescue ActiveRecord::RecordNotUnique
      redirect_to draft_path 
    end
  end

  private
    def owner_params
      params.require(:ownership).permit(:order_id, :player_id, :team_id)
    end
end