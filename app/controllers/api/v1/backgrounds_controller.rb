class Api::V1::BackgroundsController < ApplicationController
  def index
    background = UnsplashFacade.image(params[:location])

    render json: ImageSerializer.new(background)
  end
end
