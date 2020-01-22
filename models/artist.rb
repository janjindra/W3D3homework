require('pg')
require_relative('sql_runner.rb')

class Artist

attr_accessor :id, :first_name, :last_name

def initialize (options)
  @id = options['id'].to_i if options['id']
  @first_name = options['first_name']
  @last_name = options['last_name']
end

#Save Artists
  def save
    sql = "INSERT INTO artist (first_name, last_name) VALUES ($1, $2) RETURNING id"
    values = [@first_name, @last_name]
    result = SqlRunner.run(sql, values) #NEW due to
    @id = result[0]["id"].to_i
  end

#List All Artists
  def Artist.all()
    sql = "SELECT * FROM artist;"
    artists = SqlRunner.run(sql)
    return artists.map{|person| Artist.new(person)}
  end

#Edit Artists
  def update()
    sql = "UPDATE album SET (first_name, last_name) = ($1,$2) WHERE id = $3"
    values = [@id, @first_name, @last_name]
    SqlRunner.run(sql, values)
  end

#Delete an Artist
  def delete()
    sql = "DELETE FROM artist where id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

#Delete All Artists
  def Artist.delete_all()
    sql = "DELETE FROM artist"
    SqlRunner.run(sql)
  end


#Get the artist for a particular album
def Artist.artist_by_album(id)
  sql = "SELECT * FROM artist WHERE id= $1"
  values = [id]
  results = SqlRunner.run(sql, values)
  artist_data = results.first
  artist = Artist.new(artist_data)
  return artist
end


#
# def albums()
#   sql = "SELECT * FROM albums WHERE artist_id= $1"
#   values = [@id]
#   results = SqlRunner.run(sql, values)
#   albums = results.map{|order| Album.new(album)}
#   return albums
end
