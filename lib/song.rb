require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  # def name=(name)
  #   @name = name
  # end
  #
  # def artist_name(artist_name)
  #   @artist_name = artist_name
  # end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    self.all << song
    song
   end

  def self.new_by_name(song_name)
    song = self.new
    song.name = song_name
    song
  end

  def self.create_by_name(song_name)
    new_song = self.new
    new_song.name = song_name
    self.all << new_song
    new_song
  end

  def self.find_by_name(song_name)
    self.all.find { |songs| songs.name == song_name }
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
    song = self.new
    new_file = filename.split(" - ")
      song.artist_name = new_file[0]
      song.name = new_file[1].chomp(".mp3")
      song
  end

  def self.create_from_filename(filename)
    self.all << self.new_from_filename(filename)
    # binding.pry
  end

  def self.destroy_all
    self.all.clear
  end

end
