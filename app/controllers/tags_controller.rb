class TagsController < ApplicationController
  def show
    @tag = params[:id]
    @cosme_pictures = CosmePicture.tagged_with(params[:id]).page(params[:page])
  end
end
