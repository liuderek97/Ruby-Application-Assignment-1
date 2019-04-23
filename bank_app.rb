
def start_app
	puts "Welcome to the banking app"

	puts "Please Login or Create an Account"
	user_response = gets.chomp.downcase

    if user_response.include?("login")
        
  	puts "Please enter your name"
    
    puts "Please enter your password"
    
    elsif user_response.include?("create")
  	    User.create_account
	end

		puts "What would you like to do? (options: Balance, Deposit, Withdraw)"
		user_response = gets.chomp.downcase

		if user_response == "balance"
    	    puts balance
		elsif
    	    puts "Invalid selection"
        end
end

class User
  def initialize(name, age)
    @name = name 
    @age = age
  end
  
  def name 
    @name 
  end
  
 def age
    @age
 end

 def self.create_account
    puts "Please enter your First Name"
    user_first_name = gets.chomp
    puts"Please enter your Last Name"
    user_last_name = gets.chomp
    puts "Welcome #{user_first_name} Please enter your age"
    user_age = gets.chomp
    system "clear"
    puts "Please enter a username"
    user_name = gets.chomp
    puts"Please enter the password you would like to use"
    user_password = gets.chomp
    @@balance = 0.0
    user_first_name = Account.new(user_name, user_password, @@balance)
end
  
end

class Account

    def initialize(user_name, password, balance)
        @user_name = user_name
        @password = password
        @balance = balance
    end

    def user_name
        @user_name
    end

    def password
        @password
    end
    
    def balance
        @balance
    end

    def new_account_number
        unique_id = 6.times.map { rand(0..7) }.join.to_i
    end

end

start_app
