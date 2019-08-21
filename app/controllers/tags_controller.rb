class TagsController < ApplicationController
  def index
    @tags = Tag.all
  end

  def save_with_session
    session[:tag_ids] = params[:tags_session][:tags][1..-1]
    redirect_to restaurants_path
  end


end
