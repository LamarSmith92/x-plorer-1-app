# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Satellite.destroy_all

Satellite.create(:id => 1, :name=>'International Space Station (I.S.S.)', :picture=>'http://i.imgur.com/0KKbZwe.jpg?2', :description=>'The International Space Station took 10 years and over 30 missions to assemble. It is the result of unprecedented scientific and engineering collaboration among five space agencies representing 15 countries. The space station is approximately the size of a football field: a 460-ton, permanently crewed platform orbiting 240 miles above Earth. It is about four times as large as the Russian space station Mir and five times as large as the U.S. Skylab.

The idea of a space station was once science fiction, existing only in the imaginations of men until it became clear in the 1940s that construction of such a structure might be attainable by our nation. As the Space Age began in the 1950s, designs of “space planes” and stations dominated popular media. The first rudimentary station was created in 1969 by the linking of two Russian Soyuz vehicles in space, followed by other stations and developments in space technology until construction began on the ISS in 1998, aided by the first reusable spacecraft ever developed: the American shuttles.

Until recently, U.S. research space on board the ISS had been reserved for mostly government initiatives, but new opportunities for commercial and academic use of the ISS are now available, facilitated by CASIS.')
