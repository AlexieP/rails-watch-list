class ListsController < ApplicationController

  # GET ALL
  def index
    @list = List.all
  end

  # SHOW
  def show
  end

  # NEW
  def new
    @list = List.new
  end

  # POST
  def create

  end

end
