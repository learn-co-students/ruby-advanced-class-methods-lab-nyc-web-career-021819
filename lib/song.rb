require 'pry'
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
    self.new.save
    self.all[-1]
  end

  def self.new_by_name(song_name)
    new_song = self.new
    new_song.save
    new_song.name = song_name
    self.all[-1]
  end

  def self.create_by_name(song_name)
    new_song = self.new
    new_song.save
    new_song.name = song_name
    self.all[-1]
  end

  def self.find_by_name(song_name)
    self.all.find do |song|
      song.name == song_name
    end
  end

  def self.find_or_create_by_name(song_name)
    if self.find_by_name(song_name)
      self.find_by_name(song_name)
    else
      self.create_by_name(song_name)
    end
  end

  def self.alphabetical
    self.all.sort_by do |song|
      song.name
    end
  end

  def self.new_from_filename(filename)
    filename_array = filename.split(" - ")
    artist = filename_array[0]
    song = filename_array[1]
    song_name = song.split(".")[0]
    new_song = self.create_by_name(song_name)
    new_song.artist_name = artist
    new_song
  end

  def self.create_from_filename(filename)
    self.new_from_filename(filename)
  end

  def self.destroy_all
    @@all.clear
  end

end
