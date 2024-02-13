class PhotosController < ApplicationController
  def index
    @the_photos = Photo.all.order({:created_at => :desc})
    render({:template => "photo_templates/index"})
  end
  
  def show
    the_id = params.fetch("path_id")
    @the_photo = Photo.find(the_id)
    @the_comments = Comment.where({:photo_id => @the_photo.id}).order({:created_at => :desc})
    render({:template => "photo_templates/show"})
  end

  def create
    the_photo = Photo.new
    the_photo.image = params.fetch("input_image")
    the_photo.caption = params.fetch("input_caption")
    the_photo.owner_id = params.fetch("input_owner_id")

    if the_photo.owner_id.present?
      the_photo.save
      matching_photos = Photo.where({:image => the_photo.image, :caption => the_photo.caption, :owner_id => the_photo.owner_id}).first
      redirect_to("/photos/#{matching_photos.id}", { :notice => "Photo created successfully."} )
    else
      redirect_to("/photos", { :notice => "Photo failed to create successfully."} )
    end
  end

  def update
    the_id = params.fetch("path_id")
    matching_photo = Photo.find(the_id)
    matching_photo.image = params.fetch("input_image")
    matching_photo.caption = params.fetch("input_caption")
    
    matching_photo.save
    redirect_to("/photos/#{matching_photo.id}", { :notice => "Photo updated successfully."} )
  end
  
  def destroy
    the_id = params.fetch("path_id")
    matching_photo = Photo.find(the_id)
    
    matching_photo.destroy
    redirect_to("/photos", {:notice => "Photo deleted successfully."})
  end
end
