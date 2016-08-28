require 'httparty'
require 'dalli'

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

  def self.normalize(hero_lookup_results)
    # this should take a return value from marvel or comicvine and
    # turn it into a hero object that can be used.
    name = hero_lookup_results.parsed_response["results"]["name"]
    aliases = hero_lookup_results.parsed_response["results"]["aliases"]
    description = hero_lookup_results.parsed_response["results"]["deck"]
    image_url = Hero.image_setter(hero_lookup_results.parsed_response["results"]["image"], "icon_url")
    id_obj = {ComicVine: hero_lookup_results.parsed_response["results"]["id"]}
    gender = hero_lookup_results.parsed_response["results"]["gender"]

    hero = Hero.new(name, aliases, description, image_url, id_obj, gender)

    return hero
  end

  def self.find_all(char_name_string)
    # this will utilize comic_vine to find hero and deliver for normalizing
    search = Rails.cache.fetch("comicvine_character/#{char_name_string}", expires_in: 3.days) do
      HTTParty.get("http://comicvine.gamespot.com/api/search/?query=#{char_name_string}&format=json&api_key=#{ENV["COMICVINE_PRIVATE"]}&resources=character&field_list=name,id,image")
    end
    heroes = []
    search["results"].each do |char|
      heroes << char
    end
    return heroes
  end

  def self.find_char(character_id_string)
    search = Rails.cache.fetch("comicvine_character/#{character_id_string}", expires_in: 3.days) do
      HTTParty.get("http://comicvine.gamespot.com/api/character/4005-#{character_id_string}/?api_key=#{ENV["COMICVINE_PRIVATE"]}&field_list=aliases,deck,name,gender,id,image&format=json")
    end
  end

  def self.group(array_of_inputs)
    hero_array = []
    array_of_inputs.each do |input|
      hero_array.push(Hero.normalize(Hero.find_char(input))) if !input.nil?
    end
    
    return hero_array
  end


  def self.image_setter(image_url, key)
    if image_url != nil
      return image_url[key]
    else
      return "/../assets/default_icons/hero.jpg"
    end
  end

end
