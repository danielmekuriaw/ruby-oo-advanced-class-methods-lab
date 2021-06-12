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
    temp_song = Song.new
    self.all << temp_song
    temp_song
  end

  def self.new_by_name(name_of_song)
    temp_song = Song.new
    temp_song.name = name_of_song
    temp_song
  end

  def self.create_by_name(name_of_song)
    temp_song = Song.new
    temp_song.name = name_of_song
    self.all << temp_song
    temp_song
  end

  def self.find_by_name(name_of_song)
    self.all.find{|song| song.name == name_of_song}
  end

  def self.find_or_create_by_name(name_of_song)

    if self.find_by_name(name_of_song)
      return self.find_by_name(name_of_song)
    else
      self.create_by_name(name_of_song)
    end

  end

  def self.alphabetical
    names = []
    self.all.each{|song| 
      names << song.name
    }

    names_sorted = names.sort!
    objects_sorted = []
    names_sorted.each{
      |name|
      objects_sorted << self.find_by_name(name)
    }
    objects_sorted
  end

  def self.new_from_filename(filename)
    separated = filename.split(" - ")
    full_name = separated[0]
    music_name = separated[1].split(".")[0]

    temp_song = Song.new
    temp_song.name = music_name
    temp_song.artist_name = full_name
    temp_song
  end

  def self.create_from_filename(filename)
    self.all << self.new_from_filename(filename)
  end

  def self.destroy_all
    self.all.clear
  end

end
