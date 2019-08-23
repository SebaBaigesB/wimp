class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @restaurant = current_user.restaurant
  end
end
