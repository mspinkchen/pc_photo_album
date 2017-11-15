class PhotosController < ApplicationController
  before_action :set_photo, :only => [:edit, :show, :update, :destroy]

  def index
    @photos = Photo.all
  end

  def new
    @photo = Photo.new

  end

def create
 @photo = Photo.new(photo_params)
 if @photo.save
 redirect_to photos_path
 else
  render action: :new
end
end



def update
  if @photo.update_attributes(photo_params)
    redirect_to photo_path(@photo)
  else
    render  :action => :edit
  end
end


def destroy
  @photo.destroy
  redirect_to photos_path
end

private

def set_photo
  @photo = Photo.find(params[:id])
end



def photo_params
  params.require(:photo).permit(:title, :date, :description)
  
end

end

