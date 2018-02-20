class Car
	
	attr_accessor :books
	attr_accessor :toys
	attr_accessor :classes
	
	
	
	@number = nil
	@books = 0
	@toys = 0
	@classes = 1
	@location = nil
	
	@locations = nil
	
	
	def initialize number = -1
		@number = number
		@locations = ["Hospital", "Cathedral", "Hillman", "Museum"]
		@location = rand(4)
		@books = 0
		@toys = 0
		@classes = 1
	end 
	
	
	
	def drive
		loop do
			checkForLoot @location
			rn = rand(2)
			@location = updateLocation @location, rn
			if @location < 0 || @location > 3	
				exitStats
				return 1
			end
		end
		-1
	end	
	
	def updateLocation leaving, r
		
		if leaving == 0
			if r == 0
				driveToCathedral leaving
			else
				driveToHillman leaving
			end
		elsif leaving == 1
			if r == 0
				exitMonroeville
				
			else
				driveToMuseum leaving
			end
		elsif leaving == 2
			if r == 0
				exitDowntown
				
			else
				driveToHospital leaving
			end
		else 
			if r == 0
				driveToHillman leaving
			else
				driveToCathedral leaving
			end
		end
	end
	
	def checkForLoot location
		if location == 2 
			@books += 1 
		elsif location == 3
			@toys += 1
		elsif location == 1
			@classes *= 2
		end
	end
	
	
	def driveToCathedral origin
		str = "Driver #{@number} heading from #{@locations[@location]} to Cathedral"
		if @location == 0
			str += " via Fourth Ave."
		else 
			str += " via Bar St."
		end
		puts str
		1
	end
	
	
	def driveToHillman origin
		str =  "Driver #{@number} heading from #{@locations[@location]} to Hillman"
		if @location == 0
			str += " via Foo St."
		else 
			str += " via Fifth Ave."
		end
		puts str
		
		2
	end
	
	
	def driveToHospital origin
		puts "Driver #{@number} heading from #{@locations[@location]} to Hospital via Foo St."
		
		
		0
	end
	
	
	def driveToMuseum origin
		puts "Driver #{@number} heading from #{@locations[@location]} to Museum via Bar St."
		
		
		3
	end
	
	def exitDowntown
		puts "Driver #{@number} heading from Hillman to Downtown via Fifth Ave."
		-1
		
	end
	
	def exitMonroeville
		puts "Driver #{@number} heading from Cathedral to Monroeville via Fourth Ave."
		-2
	
	end
	
	def exitStats
		str = "Driver #{@number} obtained #{@books} book"
		unless @books == 1 
			str += "s"
		end
		str += "!"
		puts str
		
		str = "Driver #{@number} obtained #{@toys} dinosaur toy"
		unless @toys == 1 
			str += "s"
		end
		str += "!"
		puts str
		
		str = "Driver #{@number} attended #{@classes} class"
		unless @classes == 1 
			str += "es"
		end
		str += "!"
		puts str
	end
	
	
end
		
	