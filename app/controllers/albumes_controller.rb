class AlbumesController < ApplicationController
  
  def new
    @album = Album.new
  end

  def create
    albumes = Album.create(album_params)
    if albumes.save
      flash[:success] = Settings.section.notice.album.create
      redirect_to albumes_path
    else
      render :new
    end
  end

  def update
  end

  def destroy
  end

  def show
    album = Album.find_by_id(params[:id])
    @pictures = album.pictures
  end

  def index 
    @albumes = Album.all
  end

  def add_picture
    if params[:authenticity_token].present?
      picture = Picture.create(:image => params[:picture][:image], :album_id => params[:id])
      if picture.save
       redirect_to users_pictures_path
        # respond_to do |format|
        #   format.js{ picture.js.erb }
        # end
      else
        render :back  
      end
    end
  end

  def like
    picture = Picture.find_by_id(params[:id])
    album = picture.album

    if current_user.likes picture
      album.update_attributes(:total_count => album.total_count.to_i + 1)
      redirect_to users_pictures_path
    end
  end

  def unlike
    picture = Picture.find_by_id(params[:id])
    album = picture.album

    if current_user.dislikes picture
      album.update_attributes(:total_count => album.total_count.to_i - 1)
      redirect_to users_pictures_path
    end
  end

  def pictures
    @pictures = Picture.paginate(:page => params[:page])
    respond_to do |format|
      format.html
      format.js
    end
  end

  def favourite
    # a = Array.new
    # albumes = Album.all
    # albumes.each do |alb|
    #   alb.pictures.each do | picture | 
    #     @i = a.push(picture.get_likes.count) 
    #   end
   

    # @pictures = Album.first.pictures
    #   @pictures.each do |t| 
    #     @i = a.push(t.get_likes.count) 
    #   end
  end

private
  def album_params
    params.require(:album).permit( :name, :user_id )
  end
end
