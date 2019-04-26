require_relative './accountdb.rb'

class Account
  #extend is used to make methods available to the class istelf.
  #include only makes methods in AccountDB available to an instance of account.
  extend AccountDB

  def self.display_user_accounts(user_name)
    user_accounts = find_by_user_name(user_name)
  end
  
  #using attribute accessors for instance getter and setter methods 
  attr_accessor :id, :user_name, :name, :balance

  def initialize(id, user_name, name, balance)
    @id        = id
    @user_name = user_name
    @name      = name
    @balance   = balance
  end

  def save
    #save is used to store an object's attributes (or data) into a hash, in the accounts array.
    Account.save_object_as_hash_in_array(self)
  end
end
