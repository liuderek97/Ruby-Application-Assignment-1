require_relative './accountdb.rb'

class Account
  extend AccountDB

  def self.display_user_accounts(user_name)
    puts "user passed is #{user_name}"
    user_accounts = find_by_user_name(user_name)
    # puts user_accounts.inspect
    # user_accounts.each { |account| puts "#{account.id} #{account.name} #{account.balance}" }
  end

  attr_accessor :id, :user_name, :name, :balance

  def initialize(id, user_name, name, balance)
    @id        = id
    @user_name = user_name
    @name      = name
    @balance   = balance
  end
end
