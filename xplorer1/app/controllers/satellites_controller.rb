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

      if @satellite.save
        redirect_to @satellite
else
  render 'new'
end

    end

    def destroy
      @satellite = Satellite.find(params[:id])
      @satellite.destroy


      redirect_to satellites_path

    end

    private
    def post_params
      params.require(:satellite).permit(:name, :picture, :description)
    end

end
