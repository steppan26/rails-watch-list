class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
    @bookmarks = Bookmark.where(list_id: @list)
    @bookmark = Bookmark.new
  end

  def new
    @list = List.new
  end

  def create
    List.create(list_params)
    redirect_to lists_path
  end

  private

  def list_params
    params.require(:list).permit(:name, :image)
  end
end
