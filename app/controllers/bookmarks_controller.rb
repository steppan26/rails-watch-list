class BookmarksController < ApplicationController
  def show
    @bookmark = Bookmark.find(params[:id])
  end

  def create
    new_bookmark = Bookmark.new(bookmark_params)
    new_bookmark.list_id = params[:list_id]
    if new_bookmark.save
      redirect_to list_path(new_bookmark.list_id)
    else
      render 'lists/show'
    end
  end

  def edit
    @bookmark = Bookmark.find(params[:id])
  end

  def update
    @bookmark = Bookmark.find(params[:id])
    @bookmark.update(bookmark_params)
    redirect_to list_path(@bookmark.list_id)
  end

  def destroy
    bookmark = Bookmark.find(params[:id])
    bookmark.destroy
    redirect_to list_path(bookmark.list_id)
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:movie_id, :comment)
  end
end
