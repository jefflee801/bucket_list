class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def show
    @lists = List.find(params[:id])
  end

  def new
    @lists = List.new
  end

  def create
    @list = List.new(list_params)

    if @list.save
      redirect_to pages_path
    else
      render :new
    end
      
end

private

  def lists_params
    params.require(:list).permit(.title, :author, :body)
  end
