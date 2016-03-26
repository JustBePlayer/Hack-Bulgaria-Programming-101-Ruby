def number_to_digits number
	index = 0
	a = []
	while number != 0 do
		a.push number % 10
		number /= 10
	end
	a.reverse
end

def digits_to_number(arr)
	i, result = 0, 0
	while i < arr.length
		result = result*10 + arr[i]
		i += 1
	end
	result
end


def grayscale_histogram matrix
	result = Array.new 256, 0
	i, j = 0, 0
	while i < matrix.length do
		j = 0
		while j < matrix[i].length do
			result[matrix[i][j]] += 1
			j = j.next
		end
		i = i.next
	end
	result
end

def max_scalar_product x,y
	index , sum = 0, 0
	while index < x.length
		sum += x.sort[index] * y.sort[index]
		index = index.next
	end
	sum
end

def sum_matrix matrix
	i, j, sum = 0, 0, 0

	while i < matrix.length
		while j < matrix[i].length
			sum += matrix[i][j]
			j = j.next
		end
		j = 0
		i = i.next
	end
	sum
end

def matrix_bombing_plan matrix
	i, j, sum = 0, 0, 0

	matrixHash = {}
	 copied_array = Marshal.load(Marshal.dump(matrix))

	while i < matrix.length
		while j < matrix[i].length
			#matrixHash["[#{i}, #{j}]"] = bomb_matrix matrix, i, j
			matrixHash[[i, j]] = bomb_matrix matrix, i, j
			matrix = Marshal.load(Marshal.dump(copied_array))
			j = j.next
		end
		j = 0
		i = i.next
	end
	matrixHash

end

def bomb_matrix matrix, positionY, positionX

	beginX, beginY, endX, endY = 0, 0, positionX, positionY
	new_pos_beginX, new_pos_beginY, new_pos_endX, new_pos_endY = 0, 0, positionX, positionY  

	new_pos_beginX = positionX - 1 if positionX > 0
	new_pos_beginY = positionY - 1 if positionY > 0
	new_pos_endX = positionX + 1 if positionX < matrix[0].length - 1
	new_pos_endY = positionY + 1 if positionY < matrix.length - 1

	beginX, beginY, endX, endY = new_pos_beginX, new_pos_beginY, new_pos_endX, new_pos_endY

	puts beginX, beginY, endX, endY
	while beginY <= endY
		while beginX <= endX
			if matrix[beginY][beginX] - matrix[positionY][positionX] > 0
			matrix[beginY][beginX] -= matrix[positionY][positionX]

			elsif beginX != positionX or beginY != positionY	
			matrix[beginY][beginX] = 0
			end
			beginX = beginX.next
		end
		beginX = new_pos_beginX
		beginY = beginY.next
	end
	puts matrix.to_s
	sum_matrix matrix
end

def output_hash hash1
	hash1.each do |key, value|
		puts puts key.split('').to_a
		puts value
	end
end

def max_span numbers
	max_distance = 0;
	index_i, index_k = 0, numbers.length-1


	while index_i < numbers.length
		index_k = numbers.length-1
		while index_k >= 0
			if numbers[index_i] == numbers[index_k]
				max_distance = index_k - index_i if max_distance < index_k - index_i
				index_k -= 1
				next
			end
			index_k -= 1
		end
		index_i = index_i.next
	end
	max_distance + 1
end

def group(list)
	i, arr = 1, [list.first]
	[].tap do |result|
		while i < list.length
			if list[i] == list[i-1]
				arr << list[i]
				result << arr if i == list.length - 1
			else
				result << arr
				arr = [list[i]]
			end
			i += 1
		end
	end
end

def max_consecutive list
	i, count, max = 0, 1, 1
	while i < list.length
		if list[i] == list[i + 1]
			count += 1
		else
			max = count if count > max
			count = 1
		end
		i += 1
	end
	max
end














