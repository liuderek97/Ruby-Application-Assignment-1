require_relative './terminal.rb'

class ATM
  def run
    loop do 
      input = Terminal.ask_string("(L)ogin or (C)reate a new user.")
      case input.downcase
      when "l"
        login
        break
      when "c"
        create_user
        break
      else
        puts "Please enter L/C"
      end
    end
    menu
  end

  def login
    loop do 
      user_name = Terminal.ask_string("Enter username")
      #user is a User object that contains user_name
      @user = User.find_by_user_name(user_name)
      unless @user
        puts "Username doesn't exist"
      else
        Account.display_user_accounts(user_name)
        password = Terminal.ask_string("Please enter your password")
        password == @user.password ? break : puts("wrong password")
      end
    end
  end

  def create_user
    name      = Terminal.ask_string("What is your full name?")
    age       = Terminal.ask_int("How old are you?")
    user_name = Terminal.ask_string("What would you like your username to be?")
    password  = Terminal.ask_string("What would you like your password to be?")
    #@create method returns the instance
    @user = User.create(user_name, name, age, password)
  end
  
  def open_account
    account_name = Terminal.ask_string("What is the account name?")
    @account = Account.create(@user.user_name, account_name, 0)
  end
  
  def deposit
    puts "which account would you like to deposit by number"
    account_id = gets.chomp.to_i
    @account = Account.find_by_id(account_id)
    if @account
      puts "How much would you like to deposit?"
      deposit_amount = gets.chomp.to_i
      @account.balance += deposit_amount
      @account.save
    else
      puts "that account doesnt exist"
    end
  end
  
  def withdraw
    puts "Which Account would you like to withdraw from"
    account_id = gets.chomp.to_i
    @account = Account.find_by_id(account_id)
    if @account
      loop do
        puts "How much would you like to withdraw from the account max:#{@account.balance}"
        withdraw_amount = gets.chomp.to_i
        if withdraw_amount <= @account.balance
          @account.balance = @account.balance - withdraw_amount
          @account.save
          break
        elsif withdraw_amount > @account.balance
          puts "withdraw valid amount"
        end
      end
    end
  end
      
  def menu
    loop do
      @accounts = Account.find_by_user_name(@user.user_name)
      if @accounts.count > 0
        puts "Accounts:"
        @accounts.each { |account| puts "#{account.id}. #{account.name} $#{account.balance}" } 
      end
      puts "(Open) an account, (D)eposit, (W)ithdraw" 
      case input = gets.chomp.downcase
      when "open"
        open_account
      when "d"
        deposit
      when "w"
        withdraw
      else
        puts "Not a valid option"
      end
    end
  end
end

#deposit
#which account 
# check if account exists 
# if it exists ask how much the user would like to deposit 
# make sure the minimum is one 
# when the account is found it should return the object
# account.balance + depoit amount
# account.save 
