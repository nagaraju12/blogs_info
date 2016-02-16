class AlbumsController < ApplicationController
def create
    @user = User.find(params[:user_id])
    @album = @user.albums.create(album_params)
    1.times{@album.images.build} if @album.images.blank?
    @album.save
    redirect_to user_path(@user)
  end

  def destroy
    @user = User.find(params[:user_id])
    @album = @user.albums.find(params[:id])
    @album.destroy
    redirect_to user_path(@user)
  end

  private

    def album_params
      params.require(:album).permit!
    end
  end