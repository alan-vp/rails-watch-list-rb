class BookmarksController < ApplicationController
  before_action :set_list, only: %i[new create]
  def new
    @bookmark = Bookmark.new
  end

  def create
    # opcion "boba" para setear list_id y crear asi el bookmark
    # @bookmark = Bookmark.new(bookmark_params) # 2/3 aqui pasa movie_id y comment
    # @bookmark.list = @list # 1/3 => 3/3 y aqui pasa el list_id

    # opcion "chida de rails" Rails-way parto de una instancia que tiene toda su info (name y list_id) y al crearla toma lo que le hace falta (list_id)
    @bookmark = @list.bookmarks.new(bookmark_params)
    if @bookmark.save
      redirect_to list_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to list_path(@bookmark.list), status: :see_other
  end

  private

  def set_list
    @list = List.find(params[:list_id])
  end

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end
end
