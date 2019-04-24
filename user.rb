require './userdb.rb'

class User
  extend UserDB
  #attribute accessor, to get and set variables on an instance level
  attr_accessor :user_name, :name, :age, :password

  def initialize(user_name, name, age, password)
    @user_name = user_name
    @name      = name
    @age       = age
    @password  = password
  end
end
