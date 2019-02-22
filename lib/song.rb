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
    new_song = self.new
    @@all << new_song
    new_song
  end

  def self.new_by_name(title)
    song = Song.new
    song.name = title
    song
  end

  def self.create_by_name(title)
    song = Song.create
    song.name = title
    song
  end

  def self.find_by_name(title)
    self.all.find do |song|
      song.name == title
    end
  end

  def self.find_or_create_by_name(title)
    if Song.find_by_name(title)
      Song.find_by_name(title)
    else
      Song.create_by_name(title)
    end
  end

  def self.alphabetical
    @@all.sort_by{|song| song.name}
  end

  def self.new_from_filename(filename)
    song = Song.new
    song.name = filename.split(" - ")[1].split(".")[0]
    song.artist_name = filename.split(" - ")[0]
    song
  end

  def self.create_from_filename(filename)
    song = Song.create
    song.name = filename.split(" - ")[1].split(".")[0]
    song.artist_name = filename.split(" - ")[0]
    song
  end

  def self.destroy_all
    @@all.clear
  end

end
