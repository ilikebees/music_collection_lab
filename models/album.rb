require_relative("../db/sql_runner")


class Album

  attr_accessor :name, :artist_id
  attr_reader :id

  def initialize(options) #I don't quite understand options
    @name = options['name']
    @id = options['id'].to_i if options['id']
    @artist_id = options['artist_id'].to_i
  end

  def save()
    sql = "INSERT INTO albums (name, artist_id) VALUES ($1, $2) RETURNING id"
    values = [@name, @artist_id]
    @id = SqlRunner.run(sql, values)[0]["id"].to_i
  end

  def artist()
    sql = "SELECT * FROM artists WHERE id = $1"
    values = [@artist_id]
    artist = SqlRunner.run(sql,values)
    result = Artist.new(artist.first)
    return result
  end

  def self.all()
   sql = "SELECT * FROM albums"
   albums = SqlRunner.run( sql )
   result = albums.map { |album_hash| Album.new( album_hash ) }
   return result
 end

  def delete()
    sql = "DELETE FROM albums WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE FROM albums"
    SqlRunner.run(sql)
  end







end
