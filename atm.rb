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
  
  def menu
    @accounts = Account.find_by_user_name(@user.user_name)
    @accounts.each { |account| puts "#{account.id}. #{account.name} $#{account.balance}" } 
    puts "(Open) an account" 
    puts "(D)eposit"
    puts "(W)ithdraw"
  end
end
