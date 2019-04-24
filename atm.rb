require_relative './terminal.rb'

class ATM
  def run
    loop do 
      input = Terminal.ask_string("(L)ogin or (C)reate an account.")
      case input.downcase
      when "l"
        login
        puts "user is #{@user.inspect}"
        break
      when "c"
        create_account
        break
      else
        puts "Please enter L/C"
      end
    end
  end

  def login
    loop do 
      user_name = Terminal.ask_string("Enter username")
      #user is a User object that contains user_name
      @user = User.find_by_user_name(user_name)
      unless @user
        puts "Username doesn't exist"
      else
        password = Terminal.ask_string("Please enter your password")
        password == @user.password ? break : puts("wrong password")
      end
    end
  end

  def create_account 
    loop do 

      name = "What is your full name?"
      if name.empty?
        puts "Must not be blank"
      else
        break
      end
    end

    age = 0
    loop do 
      puts "What is your age"
      age = gets.chomp.to_i
      if age == 0
        puts "Must not be blank"
      elsif age < 16 
        puts "must be atleast 16 to create an account with us"
      else
        break
      end
    end

    user_name = ""
    loop do
      puts "What would you like your username to be?"
      user_name = gets.chomp
      if user_name == ""
        puts "Must not be blank"
      elsif User.find_by_user_name(user_name)
        puts "sorry, username already taken"
      else 
        break
      end
    end

    password = ""
    loop do 
      puts "What would you like your password to be?"
      password = gets.chomp
      if password == ""
        puts "Must not be blank"
      else
        break
      end
    end
    #@create method returns the instance
    @user = User.create(user_name, name, age, password)
  end

  # def withdraw(withdraw_amount)
  #   $balance = balance - withdraw_amount
  #   if $balance < 0
  #     puts "withdrawal amount exceeds account balance please enter an amount less than or equal to the balance of the account"

  #   elsif $balance >= 0
  #     puts "Successful withdrawal. You withdrew #{withdraw_amount}"
  #     puts "Would you like to print the current balance of your account? (Y/N)"
  #     user_response = gets.chomp.downcase
  #     if user_response == "y" || user_response == "yes"
  #       display_balance
  #     end
  #   end
  # end

  # def deposit (deposit_amount)
  #   $balance = deposit_amount + $balance
  #   puts "Would you like to print the Balance"
  #   user_response = gets.chomp.downcase
  #   if user_response == "y" user_response == "yes"
  #       display_balance
  #   elsif user_response == "n" user_response == "no"
  #     puts "Would you like to do anything else"
  #     user_input == gets.chomp.downcase
  #     if user_input == "y"
  #     end
  #   end
  # end
end
