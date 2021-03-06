  #class variables to simplify asking questions relating to strings or integers in terminal
class Terminal
  def self.ask_string(question)
    value = ""
    loop do 
      puts question
      value = gets.chomp
      if value.empty?
        puts "Must not be blank"
      else
        break
      end
    end
    value
  end
#named parameters are not the only exception to parameters being neccessary 
  def self.ask_int(question, min: 0, max: 9999999)
    value = 0
    loop do 
      puts question
      value = gets.chomp.to_i
      if value == 0
        puts "Must not be blank"
      elsif value < min
        puts "value cant be less than #{min}"
      else
        break
      end
    end
    value
  end
end
