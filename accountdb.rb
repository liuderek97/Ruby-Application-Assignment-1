module AccountDB
  #accounts array
  @@accounts_array = [ 
    { id: 1234, user_name: "johny123", name: "savings",   balance:   15 }, 
    { id: 3452, user_name: "guy123",   name: "checking",  balance: 1530 },
    { id: 5671, user_name: "guy123",   name: "investing", balance:  925 }
  ]

  def find_by_user_name(user_name)
    #user accounts data
    user_accounts_array = @@accounts_array.select { |account_hash| account_hash[:user_name] == user_name } 
    #block variable account hash
    accounts = user_accounts_array.map { |account_hash| make_instance(account_hash) }
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
    accounts_hash = { id: id, user_name: user_name, name: name, balance: balance }
    @@accounts_array << accounts_hash
    make_instance(accounts_hash)
  end
  
  def save_object_as_hash_in_array(account)
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
