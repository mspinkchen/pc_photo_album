class PhotosController < ApplicationController
  def index
    @photos = Photo.all
  end

  def show
    @photo = Photo.find(params[:id])
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

def edit
@photo = Photo.find(params[:id])
end


def update
  @photo = Photo.find(params[:id])
  if @photo.update_attributes(photo_params)
    redirect_to photo_path(@photo)
  else
    render  :action => :edit
  end
end


def destroy
  @photo = Photo.destroy(params[:id])
  redirect_to photos_path
  
end

private

def photo_params
  params.require(:photo).permit(:title, :date, :description)
  
end

end

