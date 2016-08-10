require 'marvelite'
require 'comic_vine'
client = Marvelite::API::Client.new( :public_key => 'MARVEL_API_PRIVATE', :private_key => 'MARVEL_API_PUBLIC')
ComicVine::API.key = 'COMICVINE_API_PRIVATE'

class Hero
  attr_reader :name

  def initialize(name)
    @name = name
    # obviously more stuff goes in here, but I need to think about how I want to structure it.
  end

  def normalize(hero_lookup_results)
    # this should take a return value from marvel or comicvine and
    # turn it into a hero object that can be used.
  end

  def marvel_lookup(hero)
    # this will utilize marvelite to find hero and deliver for normalizing
  end

  def comicvine_lookup(hero)
    # this will utilize comic_vine to find hero and deliver for normalizing
  end



end
