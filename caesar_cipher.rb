# Caesar's Cipher takes a message argument (string) and a shift argument (integer)
# and returns a new encrypted message (string)

def caesar_cipher(message, shift)
  
  array_of_characters = message.split('')

  # creates an array of characters with shift applied
  array_of_shifted_characters = array_of_characters.map do |character|
    apply_shift(shift, character.ord)
  end

  # returns new string of shifted characters (encrypted message)
  array_of_shifted_characters.join('')
end


# helper function that accepts two integers shift_number and character_number,
# applies a shift value to the character, and returns a new character 

def apply_shift(shift_number, character_number)

  # is character_number A-Z, a-z, or some other character
  if character_number >= 'A'.ord && character_number <= 'Z'.ord
    character_code_start = 'A'.ord
    character_cod_end = 'Z'.ord
  elsif character_number >= 'a'.ord && character_number <= 'z'.ord
    character_code_start = 'a'.ord
    character_cod_end = 'z'.ord
  else 
    # this means character was not A-Z or a-z and was some other character
    return character_number.chr
  end
  
  # use modulo reduction for shift_number values greater than character range 26
  if shift_number > 26 || shift_number < -26
    shift_number = shift_number % 26
  end

  number_after_shift = character_number + shift_number
  
  # use modulo reduction for number_after_shift values greater than character_code_end
  # values
  if number_after_shift > character_cod_end
    number_after_shift = ((number_after_shift % character_cod_end) + character_code_start) - 1
   end

  number_after_shift.chr
end

# Queries user for a message and a shift number to use in creating an
# encrypted message



puts "Encrypt message? Yes or No?"
answer = gets.chomp
if answer.downcase == 'no'
  return
else
  puts "Please enter a  message to encrypt"
  message = gets.chomp
  puts "Enter a shift amount"
  shift_amount = gets.chomp.to_i
end

encrypted_message = caesar_cipher(message, shift_amount)

puts encrypted_message

