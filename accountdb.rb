module AccountDB
  @@accounts = [ 
    { id: 123, user_name: "johny123", name: "savings",   balance:   15 }, 
    { id: 345, user_name: "guy123",   name: "checking",  balance: 1530 },
    { id: 567, user_name: "guy123",   name: "investing", balance:  925 }
  ]

  def find_by_user_name(user_name)
    #we need to: 
    #create an array entry if it matches the condition and return what the block returns 

    # accounts = @@accounts.something do |account|
    #   if account[:user_name] == user_name
    #     make_instance(account)
    #   end
    # end
  end

  def find_by_id(id)
    account = @@accounts.detect { |accounts| accounts[:id] == id }
    account ? make_instance(account) : nil
  end

  def make_instance(account)
    new(account[:id], account[:user_name], account[:name], account[:balance])
  end 

  def create(user_name, name, balance)
    id = new_account_number
    @@accounts << { id: id, user_name: user_name, name: name, balance: balance }
    find_by_id(id)
  end

  def new_account_number
    3.times.map { rand(0..4) }.join.to_i
  end
end
