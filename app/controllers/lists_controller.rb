class ListsController < ApplicationController

  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_param)
    @list.save
    if @list.save
      redirect_to list_path(@list)
    else
      render :new
    end
  end

  private

  def list_param
    params.require(:list).permit(:name, :photo)
  end
end
