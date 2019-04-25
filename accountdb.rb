module AccountDB
  #accounts array
  @@accounts_array = [ 
    { id: 123, user_name: "johny123", name: "savings",   balance:   15 }, 
    { id: 345, user_name: "guy123",   name: "checking",  balance: 1530 },
    { id: 567, user_name: "guy123",   name: "investing", balance:  925 }
  ]

  def find_by_user_name(user_name)
    #user accounts data
    user_accounts_array = @@accounts_array.select { |account_hash| account_hash[:user_name] == user_name } 
    #block variable account hash
    accounts = user_accounts_array.map { |account_hash| make_instance(account_hash) }
    
    
    # && accounts[:user_name] == username}

    # accounts = @@account_array.something do |account|
    #   if account[:user_name] == user_name
    #     make_instance(account)
    #   end
    # end
  end
#
  def find_by_id(id)
    account_hash = @@accounts_array.detect { |account_hash| account_hash[:id] == id }
    account_hash ? make_instance(account_hash) : nil
  end

  def make_instance(account_hash)
    new(account_hash[:id], account_hash[:user_name], account_hash[:name], account_hash[:balance])
  end 

  def create(user_name, name, balance)
    id = new_account_number
    accounts_hash == { id: id, user_name: user_name, name: name, balance: balance }
    @@accounts_array << accounts_hash
    make_instance(accounts_hash)
  end

  def new_account_number
    3.times.map { rand(0..4) }.join.to_i
  end
end
