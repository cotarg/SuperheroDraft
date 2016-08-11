require 'marvelite'
require 'comic_vine'
ComicVine::API.key = ENV["COMICVINE_API_PRIVATE"]

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

  # I'm kind of thinking I want a method that finds all heroes containing
  # given word in their name or title, and serves them back
  # to be confirmed, at which point their id can be recorded.


end
