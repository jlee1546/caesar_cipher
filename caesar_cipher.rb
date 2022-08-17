# Caesar's Cipher takes a message argument (string) and a shift argument (integer)
# and returns a new encrypted message (string)

def caesar_cipher(message, shift)
  
  
  array_of_characters = message.split('')
  array_of_shifted_characters = array_of_characters.map do |character|
    character.ord
  end
  array_of_shifted_characters
end

def apply_shift(shift_number, character_number)
  if character_number >= 65 && character_number <= 90
    first = 65
    last = 90
  elsif character_number >= 97 && character_number <= 122
    first = 97
    last = 122
  end
  new_number = character_number + shift_number
  puts new_number
  puts last
  if new_number > last
    balance = shift_number - (last - character_number) - 1
    puts "balance = #{balance}"
    new_number = first + balance
  end
  puts new_number
  new_number.chr
end

  
