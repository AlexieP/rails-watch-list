class ListsController < ApplicationController
  before_action :set_list, only: %i[show]
  # GET ALL
  def index
    @lists = List.all
  end

  def show
    # @list = List.find(params[:id])
    # @bookmark = Bookmark.new
  end

  # NEW
  def new
    @list = List.new
    @movies = Movie.all
  end

  def create
    @list = List.new(list_params)
    @list.save
    if @list.save
      redirect_to list_path(@list)
    else
      render :new
    end
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy
    redirect_to list_path
  end

  private

  def set_list
    @list = List.find(params[:id])
    @bookmark = Bookmark.new
  end

  def list_params
    params.require(:list).permit(:name)
  end

end
