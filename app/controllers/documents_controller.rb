class DocumentsController < ApplicationController
  def create
    if params[:doc]
      params[:doc].each do |img|
        @booking.documents.create(doc: img)
      end

      @documents = @booking.documents
      redirect_back(fallback_location: request.referer, notice: "Сохранено...")
    end
  end

  def destroy
    @documents = Document.find(params[:id])
    @booking = @document.booking
    @documents.destroy
  end

end
