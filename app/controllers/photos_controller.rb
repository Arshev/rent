class PhotosController < ApplicationController

  def create
    @car = Car.find(params[:car_id])

    if params[:image]
      params[:image].each do |img|
        @car.photos.create(image: img)
      end

      @photos = @car.photos
      redirect_back(fallback_location: request.referer, notice: "Сохранено...")
    end
  end

  def toggle_main_photo
    @photo = Photo.find(params[:id])
    @photos = Photo.where(car_id: params[:car_id])
    
    @photos.each do |ph| 
      ph.main_photo = false
      ph.save!
    end
    @photo.main_photo = !@photo.main_photo
    if @photo.save!
      redirect_back(fallback_location: request.referer, notice: "Главное фото установлено!")
    end
  end
  
  def destroy
    @photo = Photo.find(params[:id])
    @car = @photo.car

    @photo.destroy
    @photos = Photo.where(car_id: @car.id)

    respond_to :js
  end

end
