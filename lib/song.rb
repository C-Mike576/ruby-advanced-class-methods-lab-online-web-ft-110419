require 'pry'
class Song
  attr_accessor :name, :artist_name
  attr_reader :artist_name
  @@all = []
  
  def initialize(name="", artist="")
    @name = name
    @artist_name = artist
    self
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
    self
  end
  
  def self.create
   c = Song.new
   c.save
   
  end
  
  def self.new_by_name(name)
    Song.new(name)
  end

  def self.create_by_name(name)
    c = Song.new(name)
    c.save
    
  end
  
  def self.find_by_name(name)
    @@all.each do |music|
      if music.name == name
        return music
      end
    end
    nil
  end
  
  def self.find_or_create_by_name(name)
    if find_by_name(name) == nil
      create_by_name(name)
    else
      return find_by_name(name)
    end
  end
      
  def self.alphabetical
    @@all.sort_by {|music| music.name} 
  end
  
  def self.new_from_filename(music)
    songify = music.split(/[-,.]/)
    songify.pop
    Song.new(songify[1].strip, songify[0].strip)
  end
  
  def self.create_from_filename(music)
    songify = music.split(/[-,.]/)
    songify.pop
    c = create_by_name(songify[1].strip)
    c.artist_name = songify[0].strip
    c.save
    
  end
  
  def self.destroy_all
    @@all.clear
  end
  
  
  
  
  
  
  
  
  
  
  
  

end
