

class ArgsChecker
	def check_args arr
		raise "Enter a single seed number" unless arr.count == 1
		#arr[0] = 0 unless arr[0].is_a? Integer
		arr[0].to_i
	end
end