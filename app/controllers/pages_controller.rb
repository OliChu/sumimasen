class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  # def home
  #   @recipes = Recipe.all.shuffle.take(6)
  # end
end
