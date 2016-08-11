# require 'marvelite' (removed for now as going with a CV only solution)
require 'comic_vine'
require 'httparty'
ComicVine::API.key = Rails.application.secrets.comic_vine_key

class Hero
  attr_reader :name, :aliases, :description, :image_url, :id_obj, :gender
  COMICVINE_API_CHAR_PREFIX = 4005

  def initialize(name, aliases, description, image_url, id_obj, gender)
    @name = name # hero's canonical name
    @aliases = aliases # all known aliases for hero
    @description = description # brief description of hero (uses deck property of ComicVine API)
    @image_url = image_url
    @id_obj = id_obj # a key/value pair with the providing API and the ID of the hero
    @gender = gender # gender if supplied by the API
  end

  def normalize(hero_lookup_results)
    # this should take a return value from marvel or comicvine and
    # turn it into a hero object that can be used.
  end

  # def marvel_lookup(hero)
  #   # this will utilize marvelite to find hero and deliver for normalizing
  # end

  def self.find_all(char_name_string)
    # this will utilize comic_vine to find hero and deliver for normalizing
    search = ComicVine::API.search('characters', char_name_string)
    heroes = []
    search.each do |char|
      heroes << char.name
    end
    return heroes
  end

  def self.find_char(character_id_string)
    hero = ComicVine::API.character(character_id_string)
  end

  # I'm kind of thinking I want a method that finds all heroes containing
  # given word in their name or title, and serves them back
  # to be confirmed, at which point their id can be recorded.


end
