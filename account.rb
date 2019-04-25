require_relative './accountdb.rb'

class Account
  extend AccountDB

  def self.display_user_accounts(user_name)
    user_accounts = find_by_user_name(user_name)
  end

  attr_accessor :id, :user_name, :name, :balance

  def initialize(id, user_name, name, balance)
    @id        = id
    @user_name = user_name
    @name      = name
    @balance   = balance
  end

  def save
    Account.save_object_as_hash_in_array(self)
  end
end
