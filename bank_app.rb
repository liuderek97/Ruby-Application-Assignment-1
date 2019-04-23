
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
    @@user_first_name = gets.chomp
    puts"Please enter your Last Name"
    @@user_last_name = gets.chomp

    puts "Welcome #{@@user_first_name} Please enter your age"
    @@user_age = gets.chomp
    system "clear"
    puts "Please enter a username"
    user_name = gets.chomp
    puts"Please enter the password you would like to use"
    user_password = gets.chomp
    @@balance = 0.0
    
    #create an Account Object using the username userpassword and balance.
    #The Account object will contain the username, password and the balance of the account
    user_first_name = Account.new(user_name, user_password, @@balance)
    #Test wether the information from the user class has been retained
    puts "would you like to print you user details"
    user_response = gets.chomp
    if user_response == "y"
      print_user_details
    end
    #Tester for deposit method in the Account Class
    Account.deposit_to_account
    #Tester for the Withdrawal method in the Account Class
    Account.withdraw_from_account
  end
  
  def self.print_user_details
    puts "First Name: #{@@user_first_name}"
    puts "Last Name: #{@@user_last_name}"
    puts "Age: #{@@user_age}"
  end
end

class Account

    def initialize(user_name, password, balance)
      @user_name = user_name
      @password = password
      @@balance = balance
    end

    def user_name
      @user_name
    end

    def password
      @password
    end
    
    def balance
      @@balance
    end

    def new_account_number
      unique_id = 6.times.map { rand(0..7) }.join.to_i
    end

    #This method works assuming that you are in the account that you want to deposit to
    def self.deposit_to_account
      puts "How much would you like to deposit?"
      deposit_amount = gets.chomp.to_f
      @@balance = deposit_amount + @@balance
      puts @@balance
    end
    
    #Method to withdraw money from the current account
    def self.withdraw_from_account
      puts "How much would you like to withdraw from the account"
      user_withdrawal_amount = gets.chomp.to_f
      if user_withdrawal_amount > @@balance
        puts "Sorry but you cannot withdraw an amount that exceeds the balance of the account. Please Try again"
        withdraw_from_account

      elsif user_withdrawal_amount <= @@balance
        @@balance = @@balance - user_withdrawal_amount
        puts "Withdrawal successful the current balance of the account is #{@@balance}"
      end
    end

    #def check_account_exists(user_name, password)


end

start_app
