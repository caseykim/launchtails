class FeaturedDrinksController < ApplicationController
  def index
    @drinks = Drink.featured
  end
end
