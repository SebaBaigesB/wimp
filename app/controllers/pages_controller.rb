class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    if current_user
      @restaurant = current_user.restaurant
    end
  end
end
