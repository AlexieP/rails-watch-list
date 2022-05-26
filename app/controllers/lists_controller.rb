class ListsController < ApplicationController
  before_action :set_list, only: [:new, :create]
  # GET ALL
  def index
    @lists = List.all
  end

  # SHOW
  def show
  end

  # NEW
  def new
    @list = List.new
  end

  # def create
  #   @movie = Movie.new([:bookmark[:movie]])
  #   @bookmark = Bookmark.new(bookmark_params)
  #   @bookmark.movie = @movie
  #   @bookmark.list = @list
  #   if @bookmark.save
  #     redirect_to list_path(@list)
  #   else
  #     render :new
  #   end
  # end


end
