class GarmentsController < ApplicationController
  def show
    @garment = Garment.find(params[:id])
  end

  def index
    @garments = Garment.all
  end

  def current
    api_key = Rails.application.credentials.open_weather.dig(:api_key)
    @current_temperature = TemperatureGetter.(api_key: api_key)

    @garments = Garment.set_by_temperature(@current_temperature)
    render :index
  end
end
