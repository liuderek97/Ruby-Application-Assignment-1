module Account

    @account = {}
    @account[:hi] = 40.0
    @account[:hello] = 50

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
end

# class User

#     def initialize(name, age )             
#     end

    include Account
    Account.create_account(:hello, 40.0)
    Account.does_account_exist
    Account.account_deposit(:hi, 10.0)
    Account.account_withdraw(:hi, 50.0)
    Account.account_withdraw(:hello, 40.0)

# end
