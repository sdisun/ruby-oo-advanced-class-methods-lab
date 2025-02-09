class Song
  attr_accessor :name, :artist_name
  @@all = []

  def Song.create
    song = self.new
    @@all << song
    song
  end

  def Song.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def Song.create_by_name(name)
    song = self.new
    song.name = name
    @@all << song
    song
  end

  def self.find_by_name(name)
    @@all.find{ |song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) ? self.find_by_name(name) : self.create_by_name(name)
  end

  def self.alphabetical
    @@all.sort {|a,b| a.name <=> b.name}
  end

  def self.new_from_filename(string)
    song = self.new
    song.artist_name, tmp = string.split(' - ')
    song.name = tmp.chomp('.mp3')
    song
  end

  def self.create_from_filename(string)
    song = self.new
    song.artist_name, tmp = string.split(' - ')
    song.name = tmp.chomp('.mp3')
    @@all << song
    song
  end

def self.destroy_all
  self.all.clear
end


  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

end
