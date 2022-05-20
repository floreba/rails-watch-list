class BookmarksController < ApplicationController
  before_action :set_bokmark, only: [:create]

  def new
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
  end

  def create
    @list = List.find(params[:id])
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list
    redirect_to list_path(@list)
  end

  private

  def set_bokmark_id
    @bookmark = Bookmark.find(params[:id])
  end

  def bookmark_params
    params.permit(:comment)
  end
end
