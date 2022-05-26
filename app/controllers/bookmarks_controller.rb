class BookmarksController < ApplicationController
  before_action :set_bookmark, only: :destroy
  before_action :set_list, only: [:new, :create]

  # GET/bookmarks/new
  def new
    @bookmark = Bookmark.new
    @list = List.find(params[:list_id])
  end

  #POST/bookmarks
  def create
    @movie = Movie.new([:bookmark[:movie]])
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.movie = @movie
    @bookmark.list = @list
    if @bookmark.save
      redirect_to list_path(@list)
    else
      render :new
    end
  end

  # DESTROY
  def destroy
    @bookmark.destroy
    redirect_to list_path(@bookmark.list)
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment)
  end

  def set_bookmark
    @bookmark = Bookmark.find(params[:id])
  end

  def set_list
    @list = List.find(params[:list_id])
  end
end
