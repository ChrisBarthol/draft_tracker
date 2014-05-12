class OwnershipsController < ApplicationController


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
end