require 'pry-byebug'

def caesar_cipher(string, num)
    org_string_array = string.split(' ')
a_index = 0
new_string_array = []

while a_index < org_string_array.length
    word = org_string_array[a_index]
    w_index = 0
    new_string = ''
    while w_index < word.length
        char = word[w_index]
        alphabet = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'
        if alphabet.include?(char)
            org_char_code = char.ord
            ##binding.pry
            new_char_code = org_char_code + num

            case
            when (65..90).include?(new_char_code) && (65..90).include?(org_char_code)
                letter = new_char_code.chr
               new_string += letter
            when (97..122).include?(new_char_code) && (97..122).include?(org_char_code)
                letter = new_char_code.chr
                new_string += letter
            when new_char_code > 90 && (65..90).include?(org_char_code)
                new_char_code_corrected = new_char_code - 26
                letter = new_char_code_corrected.chr
                new_string += letter
            when new_char_code > 122 && (97..122).include?(org_char_code)
                new_char_code_corrected = new_char_code - 26
                letter = new_char_code_corrected.chr
                new_string += letter
            end
        elsif !alphabet.include?(char)
            new_string += char
        end
        w_index +=1
    end
    new_string_array.push(new_string)
    a_index +=1
end
caesar_string = new_string_array.join(' ')
puts caesar_string
end

caesar_cipher("What a wonderful world!", 10)
