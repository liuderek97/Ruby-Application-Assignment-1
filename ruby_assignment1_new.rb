module Account

    @account = {}
    @account[:hi] = 40.0
    @account[:hello] = 50.0

    def create_account(id, balance)
        @account[:id] = balance  
        puts @account
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



end

class User

    def initialize(first_name,last_name, age, user_name, password)
        @first_name = first_name
        @last_name = last_name
        @age = age
        @user_name = user_name
        @password = password
    end
   
    #Method to check if a user exists still being worked on. 
    #Checks by passing string user_name and password if the arguments are equal to the created object variables the user exists
    def verify_user_exists(user_name, password)
        if user_name == @user_name && password = @password
            puts "user exists"
            puts user_name
        end
        
        if user_name != @user_name && password != @password
            puts "user does not exist"
        end
    end
end

include Account
Account.create_account(:hello, 40.0)
Account.does_account_exist
Account.account_deposit(:hi, 10.0)
# Account.account_withdraw(:hi, 50.0)
# Account.account_withdraw(:hello, 40.0)
Account.transfer_from_account

#Tests to check if objects created exist and can be verified
test = User.new("Derek", "Liu", 21, "LiuDerek", "hello")
test.verify_user_exists("LiuDerek", "hello")
test1 = User.new("Derek3", "Liu", 21, "LiuDerek3", "hello3")
test1.verify_user_exists("LiuDerek3", "hello3")
