require("pry")
require_relative("../models/album")
require_relative("../models/artists")


artist1 = Artist.new({'name' => 'artist1'})
p artist1

album1 = Album.new({'name' => 'album1', 'artist_id' => artist1.id})
p album1
