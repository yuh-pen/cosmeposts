class TagsController < ApplicationController
  def show
    @tagname = params[:format]
    @cosme_pictures = @user.find_related_tag("マキシマイザー")
  end
end
