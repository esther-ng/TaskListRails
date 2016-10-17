class User < ActiveRecord::Base
  validates :email, :uid, :provider, presence: true
  has_many :tasks

  def self.build_from_github(auth_hash) #encapsulating the functionality of building the user from github from model instead of controller
    user       = User.new #create a new user
    user.uid   = auth_hash[:uid] #assign attributes
    user.provider = 'github'
    user.name  = auth_hash['info']['name']
    user.email = auth_hash['info']['email']
    # could user.save here then return true or false and pivot on that in the controller
    return user
  end
end
