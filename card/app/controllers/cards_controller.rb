class CardsController < ApplicationController
  layout 'cards'
  def index
    @cards = Card1.all
  end

  def show
    @cards = Card1.find (params[:id])
  end

  def add
    if request.post? then
      Card1.create(card_param)
      g
    else
      @cards = Card1.new
    end

  end

  def edit
    @cards = Card1.find(params[:id])
    if request.post? then
      @cards.update(card_param)
      g
    end
  end

  def delete
    Card1.find(params[:id]).destroy
    g
  end


  private
  def card_param
    params.require(:person).permit(:title,:author,:price,:publisher,:memo)
  end

  def g
    redirect_to '/cards'
  end
end
