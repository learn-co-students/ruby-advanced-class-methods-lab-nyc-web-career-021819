class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = Song.new
    @@all << song
    song
  end

  def self.new_by_name(song_name)
     song = self.new
     song.name = song_name
     song
   end

   def self.create_by_name(song_name)
     song = Song.create
     song.name = song_name
     song
   end

   def self.find_by_name(song_name)
     @@all.find{|title| title.name == song_name}
   end

   def self.find_or_create_by_name(song_name)
     if self.find_by_name(song_name)
       self.find_by_name(song_name)
     else
       self.create_by_name(song_name)

     end
  end

  def self.alphabetical
    array = []
    @@all.sort_by {|word| word.name}
  end

  def self.new_from_filename(song_file)
    new_song = song_file.split(" - ")
    newer_song = new_song[1]
    artist = new_song[0]
    newest_song = newer_song.split(".")
    final_song = newest_song[0]
    final_song

    song = Song.new
    song.name = final_song
    song.artist_name = artist
    song
  end

  def self.create_from_filename(song_file)
    new_song = song_file.split(" - ")
    newer_song = new_song[1]
    artist = new_song[0]
    newest_song = newer_song.split(".")
    final_song = newest_song[0]
    final_song

    song = Song.create
    song.name = final_song
    song.artist_name = artist
    song

  end

  def self.destroy_all
    @@all.clear
  end 

end
