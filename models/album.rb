require_relative("../db/sql_runner")


class Album

  attr_accessor :name, :artist_id
  attr_reader :id

  def initialize(options)
    @name = options['name']
    @id = options['id'].to_i if options['id']
    @artist_id = options['artist_id'].to_i
  end

  def save()
    sql = "INSERT INTO albums
    (
      name,
      artist_id
    ) VALUES
    (
      $1, $2
    )
    RETURNING id"
    values = [@name, @artist_id]
    @id = SqlRunner.run(sql, values)[0]["id"].to_i
  end




end
