class SimRunner

	def run args
	require_relative 'ArgsChecker'
	require_relative 'Car'


	aCheck = ArgsChecker::new


	aCheck.check_args ARGV
	


	srand(ARGV[0].to_i)

	for i in 1..5 do
		driver = Car::new i
		driver.drive
		end
	end


end