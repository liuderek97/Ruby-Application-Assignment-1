module UserDB
  #class instance variables must be defined out side of methods
  #class level variables hold data that belongs to the class
  #class instance array containing a hash for each user
  @@users_array = [ 
    { user_name: "johny123", name: "john", age: "19", password: "password1" }, 
    { user_name: "mike3",    name: "mike", age: "25", password: "password2" },
    { user_name: "david3",   name: "david",age: "27", password: "password3" }
  ]

  def find_by_user_name(user_name)
    #detect iterates through the array(users), passes each array entry into the block 
    #when the block returns true it returns that user hash
    user_hash = @@users_array.detect { |user_hash| user_hash[:user_name] == user_name }
    #if user is true(has a value), calls make_instance for user, otherwise nil
    user_hash ? make_instance(user_hash) : nil
  end

  def make_instance(user_hash)
    #when in class methods, self is the class object
    new(user_hash[:user_name], user_hash[:name], user_hash[:age], user_hash[:password])
  end
  
  #create puts passed params into a hash, then adds hash to user array
  def create(user_name, name, age, password)
    user_hash = { user_name: user_name, name: name, age: age, password: password }
    @@users_array << user_hash
    make_instance(user_hash)
  end
end
