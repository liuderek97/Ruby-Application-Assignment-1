def start_app
	puts "Welcome to the banking app"

	puts "Please Login or Create an Account"
	user_response = gets.chomp.downcase

	if user_response.include?("login")
  	puts "Please enter your name"
    
    puts "Please enter your password"
    
    elsif user_response.include?("create")
  	    create_account
	end

		puts "What would you like to do? (options: Balance, Deposit, Withdraw)"
		user_response = gets.chomp.downcase

		if user_response == "balance"
    	    puts @@balance
		elsif
    	    puts "Invalid selection"
        end
end

def create_account
    puts "Please enter your first and last name"
    user_name = gets.chomp
    puts "Welcome #{user_name} Please enter your age"
    user_age = gets.chomp
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

  
end

class Account

    def new_account_number
        unique_id = 6.times.map { rand(0..7) }.join.to_i
    end

end

start_app