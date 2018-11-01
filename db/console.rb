
require_relative("../models/album")
require_relative("../models/artist")

require("pry-byebug")

Album.delete_all()
Artist.delete_all()

artist1 = Artist.new({ 'name' => 'Queen'})
artist1.save();
album1 = Album.new({ 'name' => 'Bohemian Rapsody', 'artist_id' => artist1.id})
album1.save();
album2 = Album.new( { 'name' => 'Dark Side of the moon', 'artist_id' => artist1.id } )
album2.save()



# artist1 = Artist.new({'name' => 'artist1'})
# p artist1
#
# album1 = Album.new({'name' => 'album1', 'artist_id' => artist1.id})
# p album1
