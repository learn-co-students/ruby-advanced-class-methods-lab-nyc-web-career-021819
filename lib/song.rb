require "pry"

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def initialize
    @name = name
  end

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

  def self.new_by_name(name)
    song = Song.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = Song.new
    song.name = name
    self.all << song
    song
  end

  def self.find_by_name(name)
    self.all.find do |songs|
        songs.name == name
        # binding.pry
    end
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name).nil?
      self.create_by_name(name)
    else
      self.find_by_name(name)
    end
  end

  def self.alphabetical
    songs_array = @@all.sort_by {|songs| songs.name}
    songs_array
  end

  # def self.artist_name=(artist_name)
  #   @artist_name = artist_name
  # end

  def self.new_from_filename(song)
    new_song = song.split(".")
    new_song = new_song[0].split("-")
    new_song_artist = new_song[0].chop
    new_song_title = new_song[1].lstrip
    new_song = find_or_create_by_name(new_song_title)
    new_song.artist_name = new_song_artist
    new_song
  end

  def self.create_from_filename(song)
    new_song = new_from_filename(song)
    @@all << new_song
  end

  def self.destroy_all
    @@all = []
    @@all
  end



end
