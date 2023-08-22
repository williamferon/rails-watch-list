class BookmarksController < ApplicationController
  before_action :set_bookmark, only: [:show, :edit, :update, :destroy]

  def index
    @bookmarks = Bookmarks.all
  end

  def show
  end

  def new
    @Bookmark = Bookmark.new
  end

  def create
    @list = List.find(params[:list_id])
    @Bookmark = Bookmark.new(bookmark_params)
    @Bookmark.list = @list
    if @Bookmark.save
      redirect_to list_path(@list), notice: 'bookmark was successfully created.'
    else
      render "lists/show"
    end
  end

  def edit
  end

  def update
    if @bookmark.update(bookmark_params)
      redirect_to @bookmark, notice: 'bookmark was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    bookmark.destroy
    redirect_to bookmarks_url, notice: 'bookmark was successfully destroyed.'
  end

  private

  def set_bookmark
    @bookmark = Bookmark.find(params[:id])
  end

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end

end
