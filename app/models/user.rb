class User < ActiveRecord::Base
  has_many :votes
  has_many :matches, through: :match_membership
  has_many :teams

    def self.find_or_create_by_omniauth(auth_hash)
    # Find or create a user
    user = self.find_by(provider: auth_hash["provider"], uid: auth_hash["info"]["id"])
    
    if !user.nil?
      return user
    else
      user = User.new
      user.uid = auth_hash["info"]["id"]
      user.provider = auth_hash["provider"]
      user.name = auth_hash["info"]["display_name"]
      user.email = auth_hash["info"]["email"]
      user.image = auth_hash["info"]["images"][0]["url"]
      if user.save
        return user
      else
        return nil
      end
    end
  end
end
