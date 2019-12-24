class HandsController < ApplicationController
  def index
    @hands = Hand.all
  end
  def show
    @hand = Hand.find(params[:id])
  end
  def new
  end
  def create
    @hand = Hand.new(params.require(:hand).permit(:cards, :result))
    @hand.save
    redirect_to @hand
  end
  def destroy
    @hand = Hand.find(params[:id])
    @hand.destroy
    redirect_to hands_path
  end

  private
  def calculate_hand
    return "something"
  end
end
