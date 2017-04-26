# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Satellite.destroy_all

   Satellite.create(:id => 1, :name=>'I.S.S', :picture=>'', :description=>'Floating space station in the orbit of the Earth that you can see if you have a fucking telescope, but not with your camera.')

   Satellite.create(:id => 2, :name=>'Some other satellite', :picture=>'', :description=>'this is another satellite that\'s floating above the fucking earth. Save our fucking planet, SHAYA!!!.')
