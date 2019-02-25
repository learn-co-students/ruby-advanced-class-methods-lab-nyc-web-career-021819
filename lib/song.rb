require "pry"

class Song

  attr_accessor :name, :artist_name
  @@all = []

  def initialize()
    @name = nil
    @artist_name = nil
    @@all << self
  end

  def self.create
    Song.new()
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.new_by_name(name)
    new_song = Song.new()
    new_song.name= name
    new_song
  end

  def self.create_by_name(name)
    new_song = Song.new()
    new_song.name= name
    new_song.save
    new_song
  end

  def self.find_by_name(name)
    self.all.find do |song|
      song.name == name
    end
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name) == nil
      self.create_by_name(name)
    else
      self.find_by_name(name)
    end
  end

  def self.alphabetical
    self.all.sort_by do |song|
      song.name
    end.uniq
  end

  def self.new_from_filename(filename)
    file_array = filename.split(Regexp.union(" - ",".mp3"))
    new_song = Song.create_by_name(file_array[1])
    new_song.artist_name= file_array[0]
    new_song
  end

  def self.create_from_filename(filename)
    new_song = self.new_from_filename(filename).save
    new_song
  end

  def self.destroy_all
    self.all.clear
  end

end
