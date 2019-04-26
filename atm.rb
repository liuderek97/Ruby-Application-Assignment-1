require_relative './terminal.rb'

class ATM
  def run
    loop do 
      #Terminal.ask_string call ensures the answer is not blank nor invalid
      #Then it is passed through the case statement to ensure a desired answer is achieved 
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
      #user holds a User object with the name of the passed username
      @user = User.find_by_user_name(user_name)
      unless @user
        puts "Username doesn't exist"
      else
        Account.display_user_accounts(user_name)
        password = Terminal.ask_string("Please enter your password")
        #ternary operator evaluating if the password entered is the correct password 
        # or exist based on comparisons to existing passwords if the password is wrong
        # the expression evaluates false and will print a message notifying the user of
        #the error
        password == @user.password ? break : puts("wrong password")
      end
    end
  end

  def create_user
    name      = Terminal.ask_string("What is your full name?")
    #ask int compares age to a value as well as ensuring a valid input 
    age       = Terminal.ask_int("How old are you?")
    user_name = Terminal.ask_string("What would you like your username to be?")
    password  = Terminal.ask_string("What would you like your password to be?")
    #@create method returns the instance
    @user = User.create(user_name, name, age, password)
  end
  
  def open_account
    account_name = Terminal.ask_string("What is the account name?")
    #stores a newly created account in @account variable
    @account = Account.create(@user.user_name, account_name, 0)
  end
  
  def deposit
    puts "which account would you like to deposit by account id"
    account_id = gets.chomp.to_i
    @account = Account.find_by_id(account_id)
    #stores a valid account in @account variable to be called later
    if @account
      puts "How much would you like to deposit?"
      deposit_amount = gets.chomp.to_f
      @account.balance += deposit_amount
      @account.save
    else
      puts "that account doesnt exist"
    end
  end
  
  def withdraw
    puts "Which Account would you like to withdraw from by account id"
    account_id = gets.chomp.to_i
    @account = Account.find_by_id(account_id)
    if @account
      loop do
        puts "How much would you like to withdraw from the account max:#{@account.balance}"
        withdraw_amount = gets.chomp.to_f
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
        #iterates through the account object and displays each piece of information
        @accounts.each { |account| puts "#{account.id}. #{account.name} $#{account.balance.round(2)}" } 
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
