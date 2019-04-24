#ATM class interacts with the user 
class ATM
  def run
    loop do 
      puts "(L)ogin or (C)reate an account."
      input = gets.chomp.downcase
      case input 
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
      puts "Enter username"
      user_name = gets.chomp
      #user is a User object that contains user_name
      @user = User.find_by_user_name(user_name)
      if @user
        puts "Please enter your password"
        password = gets.chomp
        User.password_checker(password, user_name) 
        break
      end     
    end
  end

  def create_account 
    
    loop do 
      puts "What is your full name?"
      @name = gets.chomp
      if @name.empty?
        puts "Must not be blank"
      else
        break
      end
    end

    @age = 0
    loop do 
      puts "What is your age"
      @age = gets.chomp.to_i
      if @age == 0
        puts "Must not be blank"
      elsif @age < 16 
        puts "must be atleast 16 to create an account with us"
      else
        break
      end
    end

    @user_name = ""
    loop do
      puts "What would you like your username to be?"
      @user_name = gets.chomp
      if @user_name == ""
        puts "Must not be blank"
      elsif User.find_by_user_name(@user_name)
        puts "sorry, username already taken"
      else 
        break
      end
    end

    @password = ""
    loop do 
      puts "What would you like your password to be?"
      @password = gets.chomp
      if @password == ""
        puts "Must not be blank"
      else
        break
      end
    end
    #@create method returns the instance
    @user = User.create(@user_name, @name, @age, @password)
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

class User
  #class instance variables must be defined out side of methods
  #class level variables hold data that belongs to the class
  #class instance array containing a hash for each user
  @users = [ 
    { user_name: "johny123", name: "john", age: "19", password: "password1" }, 
    { user_name: "mike3",    name: "mike", age: "25", password: "password2" },
    { user_name: "guy123",   name: "guy",  age: "27", password: "password3" }
  ]

  def self.menu
    puts "hello"
    Account.display_accounts(@logged_user)
  end

  def self.password_checker(password, user_name)
    @logged_user = @users.find { |user| (user[:password] == password && user[:user_name] == user_name) }
    puts "password #{@logged_user}"
    menu
  end

  def self.find_by_user_name(user_name)
    #detect iterates through the array(users), passes each array entry into the block 
    #when the block returns true it returns that user hash
    user = @users.detect { |user| user[:user_name] == user_name }
    #if user is true(has a value), calls make_instance for user, otherwise nil
    user ? make_instance(user) : nil
  end

  def self.make_instance(user)
    #when in class methods, self is the class object
    self.new(user[:user_name], user[:name], user[:age], user[:password])
  end
  
  #create puts passed params into a hash, then adds hash to user array
  def self.create(user_name, name, age, password)
    @users << { user_name: user_name, name: name, age: age, password: password }
    #finds and returns the user as an instance
    find_by_user_name(user_name)
  end

  #attribute accessor, to get and set variables on an instance level
  attr_accessor :user_name, :name, :age, :password

  def initialize(user_name, name, age, password)
    @user_name = user_name
    @name      = name
    @age       = age
    @password  = password
  end
end

class Account
  @accounts = [ 
    { id: 123, user_name: "johny123", name: "savings",   balance:   15 }, 
    { id: 345, user_name: "guy123",   name: "checking",  balance: 1530 },
    { id: 567, user_name: "guy123",   name: "investing", balance:  925 }
  ]

  def self.find_by_user_name(user_name)
    #collect iterates through array, returns new array with results of block
    accounts = @accounts.collect do |account| 
      if account[:user_name] == user_name
        make_instance(account)
      end
    end
  end
  
  def self.find_by_id(id)
    account = @accounts.detect { |accounts| accounts[:id] == id }
    account ? make_instance(account) : nil
  end

  def self.make_instance(user)
    # p @accounts
    new(@accounts[:id], @accounts[:user_name], @accounts[:name], @accounts[:balance])
  end 

  def self.create(user_name, name, balance)
    id = new_account_number
    @accounts << { id: id, user_name: user_name, name: name, balance: balance }
    find_by_id(id)
  end

  def self.new_account_number
    3.times.map { rand(0..4) }.join.to_i
  end
  
  def self.display_accounts(user)
    puts "user passed is #{user}"
    @accounts.map {|user| user.values}
  end

  attr_accessor :id, :user_name, :name, :balance

  def initialize(id, user_name, name, balance)
    @id        = id
    @user_name = user_name
    @name      = name
    @balance   = balance
  end
end

ATM.new.run 


# show a menu with actions

# def deposit(amount)

# end

# def withdraw(amount)

# end

# def transfer(amount, two_account)

# end
