class Admin::DrinksController < ApplicationController
  def edit
    @drink = Drink.find(params[:id])
  end

  def update
    @drink = Drink.find(params[:id])
    if @drink.update_attributes(drink_params)
      flash[:notice] = 'Drink updated.'
      redirect_to drinks_path
    else
      render :edit
    end
  end

  protected
  def drink_params
    params.require(:drink).permit(:title, :description)
  end
end
