class BookmarksController < ApplicationController

  # GET/bookmarks/new
  def new
    @bookmark = Bookmark.new
    @bookmark = Movie.find(params[:movie_id])
  end

  #POST/bookmarks
  def create
    @bookmark = Bookmark.new(bookmark_params)
    @movie = Movie.find(params[:movie_id])
    @bookmark.movie = @movie
    if @bookmark.save
      redirect_to movie_path(@movie)
    else
      render :new
    end
  end

  # DESTROY
  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to movie_path(@bookmark.movie)
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment)
  end
end
