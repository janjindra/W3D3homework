require('pg')
require_relative('sql_runner.rb')

class Album

  attr_accessor :album_name, :genre
  attr_reader :id, :artist_id

  def initialize(options)
    @id = options['if'].to_i if options['if']
    @album_name = options['album_name']
    @genre = options['genre']
    @artist_id = options['artist_id'].to_i
  end

#Save Albums
  def save()
    sql = "INSERT INTO album (album_name, genre, artist_id) VALUES ($1, $2, $3) RETURNING id"
    values = [@album_name, @genre, @artist_id]
    result = SqlRunner.run(sql, values)
  end

#List All Albums
  def Album.all()
    sql = "SELECT * FROM album"
    albums = SqlRunner.run(sql)
    return albums.map{|album| Album.new(album)}
  end

#Edit Albums
  def update()
    sql = "UPDATE album SET (album_name, genre) = ($1,$2) WHERE id = $3"
    values = [@topping, @quantity, @customer_id, @id]
    SqlRunner.run(sql, values)
  end

#Delete an Album
  def delete()
    sql = "DELETE FROM album where id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

#Delete All Albums
  def Album.delete_all()
    sql = "DELETE FROM album"
    SqlRunner.run(sql)
  end


#List all the albums by an artist
  def Album.find(id)
      sql = "SELECT * FROM album WHERE artist_id = $1"
      values = [id]
      results = SqlRunner.run(sql, values)
      return results.map{|album| Album.new(album)}
    end


  # def customer()
  #   sql = "SELECT * FROM artist WHERE id = $1"
  #   values = [@artist_id]
  #   results = SqlRunner.run(sql, values)
  #   artist_data = results.first
  #   artist = Customer.new(artist_data)
  #   return artist
  end
