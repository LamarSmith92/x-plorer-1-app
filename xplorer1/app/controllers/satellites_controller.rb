class SatellitesController < ApplicationController

  def  index
    @satellites = Satellite.all
    cookies[:lat_lon] = JSON.generate([47.68, -122.37])
  end

  def show
    sat_id = params[:id]
    @satellite = Satellite.find_by_id(sat_id)
  end

  def new
    @satellite = Satellite.new
  end

    def create
      @satellite = Satellite.new(satellite_params)
    end

    def destroy
      @satellite = Satellite.find(params[:id])
      @satellite.destroy
    end

    private
    def post_params
      params.require(:satellite).permit(:name, :picture, :description)
    end

end
