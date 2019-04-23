@@balance = 0
@@hash = {}
@@hash[:Hi] = "1234"


    def check_account_exists(name, password)
        if @@hash.has_key?(name) && @@hash.has_value?(password)
            puts "Account exists"
            @@hash.each {|key, value| 
                if name = key
                    puts "Welcome #{key}"  
                end
            }  
            return true        
        end
    end

    def account_details
        if check_account_exists(@@user_name, @@user_password)
            puts "hi"
        end
    end

    def create_account 
        puts "Please make an account"
        system "clear"
        puts "Please enter your name"
        @@user_name = gets.chomp.to_sym
        puts "Please enter a password to use"
        @@user_password = gets.chomp
        system "clear"
        @@hash[@@user_name] = @@user_password 
        puts hash
        check_account_exists(@@user_name, @@user_password)
        account_details
    end




puts "Welcome to the banking app"

puts "Do you have an account"
user_response = gets.chomp.downcase

if user_response == "yes" || user_response == "y"
    puts "Please enter your name"
    @@user_name = gets.chomp.to_sym
    puts "Please enter your password"
    @@user_password = gets.chomp
    check_account_exists(@@user_name, @@user_password)
    puts @@hash

elsif user_response == "no" || user_response == "n"
   create_account
end

puts "What would you like to do? (options: Balance, Deposit, Withdraw)"
user_response = gets.chomp.downcase

if user_response == "balance"
    puts @@balance
elsif
    puts "Invalid selection"
end




