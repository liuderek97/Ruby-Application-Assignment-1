# require '/Users/aidans_mac/gentech_2019/Ruby-Application-Assignment-1/RubyApp/models.rb'
require_relative 'models.rb'

include Account
Account::create_account(:hello, 40)
