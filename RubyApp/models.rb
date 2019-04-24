require_relative './index.rb'

module Account 
  @account = {}
  def create_account(id, balance)
    @account[:id] = balance
    puts @account
  end
end