require('pry')
require_relative('models/album.rb')
require_relative('models/artist.rb')

Artist.delete_all()
Album.delete_all()



artist1 = Artist.new({'first_name' => 'AAA', 'last_name' => 'A'})
artist1.save()
artist2 = Artist.new({'first_name' => 'BBB', 'last_name' => 'B'})
artist2.save()
artist3 = Artist.new({'first_name' => 'CCC', 'last_name' => 'C'})
artist3.save()
artist4 = Artist.new({'first_name' => 'DDD', 'last_name' => 'D'})
artist4.save()


album1=Album.new({
  'album_name' => 'AlbumXXa',
  'genre' => 'rock',
  'artist_id' => artist2.id
  })
album1.save()
album2=Album.new({
  'album_name' => 'AlbumXXb',
  'genre' => 'rap',
  'artist_id' => artist2.id
  })
album2.save()
album3=Album.new({
  'album_name' => 'AlbumYYY',
  'genre' => 'rock',
  'artist_id' => artist1.id
  })
album3.save()
album4=Album.new({
  'album_name' => 'AlbumZZZ',
  'genre' => 'metal',
  'artist_id' => artist3.id
  })
album4.save()
album5=Album.new({
  'album_name' => 'AlbumRRR',
  'genre' => 'pop',
  'artist_id' => artist4.id
  })
album5.save()


find_2_albums_for_artist_1=Album.find(2)
find_artist_CCC_for_album_3=Artist.artist_by_album(3)

binding.pry
nil
