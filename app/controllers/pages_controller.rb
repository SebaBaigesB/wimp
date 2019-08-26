class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    if current_user
      @restaurants = Restaurant.where(user: current_user).first
    end
  end
end
