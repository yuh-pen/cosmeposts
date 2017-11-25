class TagsController < ApplicationController
  def show
    @tag = params[:format]
    @cosme_pictures = CosmePicture.tagged_with(params[:format])
  end
end
