#Module to create an account 
module Account

    @account = {}
    @account[:hi] = 40.00
    @account[:hello] = 50.00

    def create_account(account_id, balance)
        @account[account_id] = balance  
        puts "Bank Account Created"
        print_account_details(account_id)

    end

    def does_account_exist
        puts "Please enter your account id:"
        user_id = gets.chomp.to_sym
        
        if @account.has_key?(user_id)
            puts "Account exists. Welcome user: #{user_id}"
        elsif !@account.has_key?(user_id)
            puts "Account does not exist. Please create an account"
        else
            puts "Invalid option please try again"
            does_account_exist
        end
    end

    def account_deposit(user_id, deposit_amount)
        @account[user_id] = deposit_amount + @account[user_id]
        puts "The Balance of the account: #{user_id} is :#{@account[user_id]}"  
    end

    def account_withdraw(user_id, withdraw_amount)
        
        if withdraw_amount > @account[user_id]
            puts "Error you cannot withdraw an amount that exceeds the account balance."
        
        elsif withdraw_amount <= @account[user_id]
            @account[user_id] = @account[user_id] - withdraw_amount
            puts "withdrawal successful"
            puts "New account balance is: #{@account[user_id]}"
        else
            puts "Invalid option please try again"
        end
    end

    #Transfer between two different accounts using the unique identifier 
    def transfer_from_account
        puts "Please enter the account id you'd like to transfer the money from"
        user_transfer_from = gets.chomp.to_sym
        puts "Please enter the account id that you'd like to transfer money to"
        user_transfer_to = gets.chomp.to_sym

        #Check if the given user_ids are accounts that exist 
        if @account.has_key?(user_transfer_from) && @account.has_key?(user_transfer_to)
            puts "Please enter the amount that you would like to transfer from account: #{user_transfer_from} to account: #{user_transfer_to}"
            user_transfer_amount = gets.chomp.to_f
        
            transferring_account_balance = @account[user_transfer_from]
            receiveing_account_balance = @account[user_transfer_to]
            #Update the balance of both accounts when transferring from one account to another
            @account[user_transfer_from] =  - user_transfer_amount + transferring_account_balance
            @account[user_transfer_to] = receiveing_account_balance + user_transfer_amount

            puts"The new amount of the account:#{user_transfer_from} is #{@account[user_transfer_from]}"
            puts"The new amount of the account:#{user_transfer_to} is #{@account[user_transfer_to]}"
        end
    end

    def print_account_details(account_id)
        if @account.has_key?(account_id)
            puts "Your Bank Account Details are as follows:"
            puts "Account ID: #{account_id}"
            puts "Account Balance: #{@account[account_id]}"
        end
    end



end

class User
    attr_reader :first_name, :last_name, :age, :user_name, :password, :account_id
    def initialize(first_name,last_name, age, user_name, password, account_id)
        @first_name = first_name
        @last_name = last_name
        @age = age
        @user_name = user_name
        @password = password
        @account_id = account_id
    end
   
    #Method to check if a user exists still being worked on. 
    #Checks by passing string user_name and password if the arguments are equal to the created object variables the user exists
    def verify_user_exists(user_name, password)
        if user_name == @user_name && password = @password
            puts "user exists"
            puts "Welcome #{user_name}"

        elsif user_name != @user_name && password != @password
            puts "user does not exist"
            puts "Please create an account"
            create_user

        elsif user_name == @user_name && password != @password
            puts "Incorrect password please try again"
        end

    end
    #method top create a user object
    def self.create_user
        puts "Please enter your first name:"
        user_first_name = gets.chomp

        puts "Please enter your last name:"
        user_last_name = gets.chomp
        
        puts "Please enter your age:"
        user_age = gets.chomp.to_i
        
        puts "Please enter the username you would like:"
        user_name = gets.chomp
        
        puts "Please enter the password you would like to use:"
        user_password = gets.chomp
        user_id = user_first_name + user_last_name
        temp_account_id = user_last_name + user_first_name + user_age.to_s
        account_id = temp_account_id.to_sym
        puts account_id
        user_id = User.new(user_first_name, user_last_name, user_age, user_name, user_password, account_id)
        #test to see if created object exists and holds all previous entered info from the method
        user_id.verify_user_exists(user_name, user_password)
        Account.create_account(account_id, 0.00)
        User.print_user_details(user_id)
    end

    def self.print_user_details(user)
        puts "Your Account details are as follows:"
        puts "First Name: #{user.first_name}"
        puts "Last Name: #{user.last_name}"
        puts "Age: #{user.age}"
        puts "Your unique user ID: #{user.account_id}"
    end
        
end

include Account

User.create_user
# Account.create_account(:hello, 40.0)
# Account.does_account_exist
# # Account.account_deposit(:hi, 10.0)
# # # Account.account_withdraw(:hi, 50.0)
# # # Account.account_withdraw(:hello, 40.0)
# # Account.transfer_from_account

# #Tests to check if objects created exist and can be verified
#  test = User.new("Derek", "Liu", 21, "LiuDerek", "hello", "KKKK")
#  User.print_user_details(test)
# test.verify_user_exists("LiuDerek", "hello")
# test1 = User.new("Derek3", "Liu", 21, "LiuDerek3", "hello3", "HHH")
# test1.verify_user_exists("LiuDerek3", "hello3")
# #test to see if the account exists when entering wrong credentials
# test1.verify_user_exists("LiuDerek", "hello")
# # puts test1.first_name
# # User.print_user_details(test)