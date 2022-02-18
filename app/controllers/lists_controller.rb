class ListsController < ApplicationController

  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
    @movies = Movie.all
    @bookmark = Bookmark.new
    @bookmarks = Bookmark.all
  end

# new
  def new
    @list = List.new
  end

# create
  def create
    @list = List.new(list_params)
      if @list.save
      redirect_to list_path(@list)
      else
        render :new
      end
  end

  private

  def list_params
    params.require(:list).permit(:name, :photo)
  end
end
