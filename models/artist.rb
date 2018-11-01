require_relative("../db/sql_runner")

class Artist

  attr_accessor :name
  attr_reader :id

  def initialize (options)
    @name = options['name']
    @id = options['id'].to_i if options['id']
  end

  def save()
    sql = "INSERT INTO artists(name) VALUES ($1) RETURNING *"
    values = [@name]
    @id = SqlRunner.run(sql, values)[0]["id"].to_i
  end

  def albums()
    sql = "SELECT * FROM albums
    WHERE artist_id = $1"
    values = [@id]
    albums = SqlRunner.run(sql, values)
    result = albums.map { |album_hash| Album.new(album_hash)}
    return result
  end

  def self.all()
   sql = "SELECT * FROM artists"
   artists = SqlRunner.run( sql )
   result = artists.map { |album_hash| Artist.new( album_hash ) }
   return result
 end

  def delete()
    sql = "DELETE FROM artists WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE FROM artists"
    SqlRunner.run(sql)
  end




end
