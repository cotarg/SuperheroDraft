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

  def self.normalize(hero_lookup_results)
    # this should take a return value from marvel or comicvine and
    # turn it into a hero object that can be used.
    name = hero_lookup_results.name
    aliases = hero_lookup_results.aliases
    description = hero_lookup_results.deck
    image_url = Hero.image_setter(hero_lookup_results.image, "icon_url")
    id_obj = {ComicVine: hero_lookup_results.id}
    gender = hero_lookup_results.gender

    hero = Hero.new(name, aliases, description, image_url, id_obj, gender)

    return hero
  end

  def self.find_all(char_name_string)
    # this will utilize comic_vine to find hero and deliver for normalizing
    search = Rails.cache.fetch("comicvine_character/#{char_name_string}", expires_in: 3.days) do
      search = ComicVine::API.search('character', char_name_string)
    end
    heroes = []
    search.each do |char|
      heroes << char
    end
    
    return heroes
  end

  def self.find_char(character_id_string)
    # API now requires single character searches to preface the id with "4005-"
    search = Rails.cache.fetch("comicvine_character/#{character_id_string}", expires_in: 3.days) do
      ComicVine::API.character("#{character_id_string}")
    end
    # gem doesn't actually give you results unless you fetch them.
    search.fetch
  end

  def self.group(array_of_inputs)
    hero_array = []
    array_of_inputs.each do |input|
      hero_array.push(Hero.normalize(Hero.find_char(input)))
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
