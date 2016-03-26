
def fact(n)
	index = 1
	fac = 1

	while index <= n do
		fac *= index
		index += 1
	end
	fac

end


def factorialRecursive(n)
	if n < 1
		1
	else
		temp = n * factorialRecursive(n-1)
	end
end




def sum_digits(n)
	sum = 0
	while n !=0 do
		sum += n%10
		n /= 10
	end
	sum
	
end

def factorial_digits(number)
	sum = 0
	while number != 0 do
		sum += fact(number % 10)
		number /= 10
	end
	sum
end

def digitFactorial(n)
	factorialSum = 0
	while n !=0 do
		digit = n%10
		factorialSum += factorialRecursive(digit)
		n /= 10
	end
	factorialSum
end

def count_vowels(word)
	index = 0
	count = 0
	while index < word.length do
		case word[index]
		when 'y','e','i', 'o', 'a', 'u','Y','E','I','O', 'U', 'A'
			count += 1
		end

		index += 1
	end
	count
end

def p_score(number)

	numberReverse = number.to_s.reverse.to_i
	count = 1

	while number != numberReverse do
		count += 1
		#puts count
		number += numberReverse
		numberReverse = number.to_s.reverse.to_i
	end
	count
end

def nth_lucas(number)
	l1 = 2;
	l2 = 1;
	index = 3
	if number > 2
		while index <= number do
		l1 ,l2 = l2 , l1 + l2
		index += 1
		end
		l2
	elsif number == 2 then l2
	else l1
	end
end

def first_lucas(number)
	l1 = 2;
	l2 = 1;
	index = 3
	arr = []
	if number > 2
		arr << l1 << l2
		while index <= number do
		l1 ,l2 = l2 , l1 + l2
		arr << l2
		index += 1
		end
	elsif number == 2 then arr << l1 << l2
	else arr << l1
	end
	arr
end

def hack?(number)
	binaryNumber = ''
	while number != 0 do
		binaryNumber += (number % 2).to_s
		number /= 2
	end
	binaryNumber.reverse
	return (palindrome?(binaryNumber) and binaryNumber.chars.count("1").odd?)
end

def next_hack(number)
	nextHackNumber = 0
	isFound = 0

	while isFound == 0
		if hack?(number + 1) == true
			nextHackNumber = number + 1
			isFound = true
		end
		number += 1
	end
	nextHackNumber
end

#Prime numbers

def prime? number
	isPrime = true
	index = 2

	return false if number <= 1
	return true if number == 2

	while index <= Math.sqrt(number)
		return false if number % index == 0
		index += 1
	end
	true
end

def first_primes number
	list = []
	index = 1
	count = 0
	while count < number do
		if prime?(index) == true
			list[count] = index
			count += 1
		end
		index += 1
	end
	index = 0
	while index < number do
		index += 1
	end
	list
end

def sum_of_numbers_in_string word
	index = 0
	sum = 0
	smallString = ''
	while index < word.length
		 if word[index].ord >= 48 && word[index].ord < 58
		 	smallString += word[index].to_s
		 	if index == word.length - 1
		 		sum += smallString.to_i
		 	end
		 else
		 	sum += smallString.to_i
		 	smallString = ''
		 end
		index += 1
	end
	sum
end

def anagrams? firstString, secondString
	index = 0
	indexk = 0
	while index < firstString.length

		index += 1
	end
end

def fib_number(n)
	first, second, result = 1, 1, ""
	case n
	when 1
		result = first.to_s
	else
		result = "11"
		i = 3
		while i <= n
			first, second = second, first + second
			result += second.to_s
			i += 1 
		end
	end
	result.to_i
end

def anagrams?(string1, string2)
	string1.chars.sort == string2.chars.sort
end

def count_consonants(str)
	constants = "bcdfghjklmnpqrstvwxz"
	count = 0
	str.downcase.chars.each do |chr|
		count += 1 if constants.chars.include? chr
	end
	count
end

def palindrome?(obj)
	obj.to_s == obj.to_s.reverse
end

def count_digits(n)

	count = 0
	while n > 0 do
		n /= 10
		count += 1
	end
	count
	
end

def balanced?(number)
	digits = count_digits(number)
	return true if digits == 1 or number.to_s.chars.first(digits / 2).map(&:to_i).reduce(:+) == 
								number.to_s.chars.last(digits / 2).map(&:to_i).reduce(:+)
	return false
end

def zero_insert(number)
	str = number.to_s.chars.first

	number.to_s.chars.each_cons(2) do |pair|
		str += '0' if pair.first == pair.last or (pair.first.to_i + pair.last.to_i) % 10 == 0
		str += pair.last
	end
	str.to_i
end



