class ListsController < ApplicationController
  before_action :set_list, only: [:show, :destroy]
  # GET ALL
  def index
    @lists = List.all
  end

  def show
    @bookmark = Bookmark.new
  end

  # NEW
  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to list_path(@list)
    else
      render :new
    end
  end

  def destroy
    @list.destroy
    redirect_to list_path
  end

  private

  def set_list
    @list = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:name)
  end

end
