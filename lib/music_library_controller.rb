class MusicLibraryController

  def initialize(path = "./db/mp3s")
    importer = MusicImporter.new(path)
    importer.import
  end

  def call
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    puts "What would you like to do?"

    input = gets.strip while input != "exit"
  end

  def list_songs
    songs = Song.all.sort_by{|s| s.name}
    songs.each_with_index do |song, index|
      puts "#{index + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def list_artists
    artists = Artist.all.sort_by{|a| a.name}
    artists.each_with_index do |artist, index|
      puts "#{index + 1}. #{artist.name}"
    end
  end

  def list_genres
    genres = Genre.all.sort_by{|g| g.name}
    genres.each_with_index do |genre, index|
      puts "#{index + 1}. #{genre.name}"
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    artist = gets.strip
    if Artist.find_by_name(artist)
      artist.songs.sort_by{|s| s.name}.each_with_index do |song, index|
        puts "#{index + 1}. #{song.name} - #{song.genre}"
      end
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    genre = gets.strip
    if Genre.find_by_name(genre)
      genre.songs.sort_by{|s| s.name}.each_with_index do |song, index|
        puts "#{index + 1}. #{song.artist} - #{song.name}"
      end
    end
  end

  def play_song

  end

end
