module AccountDB
  #accounts array stores information we can use to create accounts
  @@accounts_array = [ 
    { id: 1234, user_name: "johny123", name: "savings",   balance:   15.00 }, 
    { id: 3452, user_name: "david3",   name: "checking",  balance: 1530.00 },
    { id: 5671, user_name: "david3",   name: "investing", balance:  925.00 }
  ]

  def find_by_user_name(user_name)
    #find by user name method drops the result of passing a block to select.
    #user_accounts_array should contain a hash or more hashes that contains the same user_name as the user_name passed
    user_accounts_array = @@accounts_array.select { |account_hash| account_hash[:user_name] == user_name } 
    #turns the passed hashes in user_accounts_array into instances or objects, so we can call methods on them as appose
    #to just using hash methods.
    accounts = user_accounts_array.map { |account_hash| make_instance(account_hash) }
  end
#
  def find_by_id(id)
    #detect returns the first item in the block that evaluates to be true
    account_hash = @@accounts_array.detect { |account_hash| account_hash[:id] == id }
    account_hash ? make_instance(account_hash) : nil
  end

  def make_instance(account_hash)
    #Account. or self. would also work here. Because we would be passing account.
    # In this case when passing self we can just leave it blank
    new(account_hash[:id], account_hash[:user_name], account_hash[:name], account_hash[:balance])
  end 

  def create(user_name, name, balance)
    id = new_account_number
    #creates a new hash with passed parameters + A random number
    accounts_hash = { id: id, user_name: user_name, name: name, balance: balance }
    #pushes new hash to accounts hash
    @@accounts_array << accounts_hash
    #ruby will execute the last piece of code, which for us creates an instance
    make_instance(accounts_hash)
  end

  def save_object_as_hash_in_array(account)
    #we want to use index notation here
    #so in an index variable we find the index of the account passed 
    #and pass it to accounts array
    index = @@accounts_array.index { |account_hash| account_hash[:id] == account.id }
    @@accounts_array[index] = {
      id:        account.id,
      user_name: account.user_name, 
      name:      account.name, 
      balance:   account.balance 
    }
  end

  def new_account_number
    4.times.map { rand(0..9) }.join.to_i
  end
end
