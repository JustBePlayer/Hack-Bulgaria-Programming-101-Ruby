#Spam and Eggs
def prepare_meal number
	meal = ''
	largest_index_spam, index = 0, 0
	is_divisible_by5 = number % 5 == 0  ? true : false

	while index <= number
		largest_index_spam = index if number % (3 ** index) == 0 
		index += 1
	end
	arr = []
	largest_index_spam.times {arr << "spam"}
	#arr << largest_index_spam.zero? ? "eggs" : ("and eggs" if is_divisible_by5)
	if largest_index_spam.zero?
		arr << "eggs"
	elsif is_divisible_by5
		arr << "and eggs"
	end
	meal = arr.join(' ')
	meal
end
#----------------------------

#Reduce file path
def reduce_file_path file_path
	index, directory_begin_index = 0, 0
	count = 1

	return "/" if file_path == "/"
	while index < file_path.length - 1
		if file_path[index] == '/'
			if file_path[index + 1] == '/'
				file_path.slice! index + 1, 1
				next
			end
			if file_path[index + 1] == '.'
				if file_path[index + 2] == '.'
					file_path.slice!(directory_begin_index..(index + 2))
					next
				else
					file_path.slice! index + 1, 1
					next
				end
			end
			directory_begin_index = index
			
		end
		if index == file_path.length - 1
				file_path.slice! index, 1
			end

		index += 1
	end
	file_path.slice! -1 if file_path.length > 1 and file_path.chars.last == '/'
	file_path
end
#----------------------------
#Word from a^nb^n
def an_bn? word
	if word.length % 2 == 0
		contain_same_characters? (word.slice 0..(word.length - 1) / 2), 'a' and contain_same_characters? (word.slice word.length / 2..word.length), 'b'
	else
	false
	end	
end

def contain_same_characters? word, c
	index = 0;
	same_characters = true

	while index < word.length and same_characters
		same_characters = false if word[index] != c
		index += 1
	end
	same_characters
end
#----------------------------

# Credit card validation
def  valid_credit_card? number
	number = number.to_s
	index, sum = 0, 0

	if number.length % 2 != 0
		while index < number.length
		sum += index % 2 == 0 ? number[index].to_i * 2 : number[index].to_i
		index += 1
		end
		sum % 10 == 0
	else
		false
	end
end
#-------------------------------

# Goldbach Conjecture
def goldbach n
	index_i, index_k = 2, n - 1
	results = []

	while index_i <= n / 2
		index_k = n - 1
		if is_prime? index_i
			while index_k >= n / 2
				results.push [index_i, index_k] if index_i + index_k == n and is_prime? index_k
				index_k -= 1
			end
		end
		index_i += 1
	end
	results
end

def is_prime? number
	isPrime = true
	index = 2

	return false if number == 0
	while index <= Math.sqrt(number) && isPrime
		isPrime = false if number % index == 0
		index += 1
	end
	if number == 2
		isPrime = true
	end
	if number == 1
		isPrime = false
	end
	isPrime
end
#-------------------------------

# Magic Square
def magic_square? matrix
	index_i, index_k = 0, 0 
	sumRow, sumCol = 0, 0
	diagonal1, diagonal2 = 0, 0
	is_magic = true
	default_sum = 0

	while index_i < matrix[0].length
		default_sum += matrix[0][index_i]
		index_i += 1
	end
	index_i = 0
	while index_i < matrix.length and is_magic
		index_k = 0
		while index_k < matrix[index_i].length and is_magic
			sumRow += matrix[index_i][index_k]
			sumCol += matrix[index_k][index_i]
			if index_i == index_k
				diagonal1 += matrix[index_i][index_k]
			end
			if index_i == matrix.length - 1 - index_k
				diagonal2 += matrix[index_i][matrix.length - 1 - index_k]
			end
			index_k += 1
		end
		if sumRow != default_sum and sumCol != default_sum and diagonal1 !=default_sum and diagonal2 != default_sum
			is_magic = false
		end
		sumRow, sumCol = 0, 0
		diagonal1, diagonal2 = 0, 0
		index_i += 1
	end
	is_magic
end

def numbers_to_message pressedSequence
	symbolsHash = {
		2 => ['a', 'b', 'c'],
		3 => ['d', 'e', 'f'],
		4 => ['g', 'h', 'i'],
		5 => ['j', 'k', 'l'],
		6 => ['m', 'n', 'o'],
		7 => ['p', 'q', 'r', 's'],
		8 => ['t', 'u', 'v'],
		9 => ['w', 'x', 'y', 'z']
	}
	is_capitalize = false
	index_i, index_k, slice_index, count = 0, 0, 0, 1
	outputSequence = ''
	while index_i < pressedSequence.length
		if pressedSequence[index_i] == pressedSequence[index_i + 1]
			count += 1
			slice_index = index_i if count == 2

		elsif pressedSequence[index_i] == 0
			outputSequence += ' '
			count = 1
			index_i += count
			next

			elsif pressedSequence[index_i] == -1
			count = 1
			slice_index = index_i
		elsif pressedSequence[index_i] == 1
			is_capitalize = true

		elsif pressedSequence[index_i] != -1
			index_k = 0
			word = pressedSequence.slice slice_index, count
			puts word 
			puts "kkkk"
			puts word[0]
			while word.length > symbolsHash[word[0]].length #index_k < word.length #symbolsHash[word[0]].length
				word.slice! 0, symbolsHash[word[0]].length	
			end

			outputSequence += is_capitalize ? symbolsHash[word[0]][word.length - 1].capitalize : symbolsHash[word[0]][word.length - 1]
			count = 1
			index_i += count
			slice_index = index_i
			is_capitalize = false
			next
		
		end
		
		index_i += 1
	end
	outputSequence
end

