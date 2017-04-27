class AddLatitudeAndLongitudeToSatellites < ActiveRecord::Migration[5.0]
  def change
    add_column :satellites, :latitude, :float
    add_column :satellites, :longitude, :float
  end
end
