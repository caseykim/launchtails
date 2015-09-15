class DrinksController < ApplicationController
  def new
    @drink = Drink.new
  end

  def create
    @drink = Drink.new(drink_params)
    if @drink.save
      flash[:notice] = 'Drink added.'
      redirect_to drinks_path
    else
      render :new
    end
  end

  def index
    @drinks = Drink.all
  end

  def destroy
    Drink.delete(params[:id])
    flash[:notice] = 'Drink deleted.'
    redirect_to drinks_path
  end

  protected
  def drink_params
    params.require(:drink).permit(:title, :description)
  end
end
