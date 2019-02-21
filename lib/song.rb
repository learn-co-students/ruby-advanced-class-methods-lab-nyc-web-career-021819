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
    song.save
    song
  end

  def self.new_by_name(song_name)
    song = Song.new
    song.name = song_name
    song
  end

  def self.create_by_name(song_name)
    song = Song.create
    song.name = song_name
    song
  end

  def self.find_by_name(song_name)
    @@all.find{|person| person.name == song_name}
  end

  def self.find_or_create_by_name(song_name)
    self.find_by_name(song_name) || self.create_by_name(song_name)
  end

  def self.alphabetical
    self.all.sort_by{|word| word.name}
  end

  def self.new_from_filename(song_file)
    parts = song_file.split(" - ")
    song_name = parts[1]
    just_song_arr = song_name.split(".")
    song_no_period = just_song_arr[0]

    song = Song.new
    song.name = song_no_period
    song.artist_name = parts[0]
    song
  end

  def self.create_from_filename(song_file)
    parts = song_file.split(" - ")
    song_name = parts[1]
    just_song_arr = song_name.split(".")
    song_no_period = just_song_arr[0]

    song = Song.create
    song.name = song_no_period
    song.artist_name = parts[0]
    song
  end

  def self.destroy_all
    self.all.clear
  end

end
