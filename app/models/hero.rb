require 'marvelite'
require 'comic_vine'
client = Marvelite::API::Client.new( :public_key => MARVEL_API_PRIVATE, :private_key => MARVEL_API_PUBLIC)

class Hero

  def initialize(name)
    @name = name
  end

end
