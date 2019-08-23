class TagsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :save_with_session]
  def index
    @tags = Tag.all
  end

  def save_with_session
    session[:tag_ids] = params[:tags_session][:tags][1..-1]
    redirect_to restaurants_path
  end
end
