class Artist
  @@all = []
  attr_accessor :name, :artist, :genre

  def initialize(name)
    @name = name
    self.class.all << self
  end

  def self.all
    @@all
  end

  def new_song(title, genre)
    Song.new(title, self, genre)
    self.songs.last
  end

  def songs
    Song.all.select do |song|
      song.artist == self
    end
  end

  def genres
    Song.all.map do |song|
      song.genre
    end
  end
  
end