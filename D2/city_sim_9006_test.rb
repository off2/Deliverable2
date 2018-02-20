
require 'minitest/autorun'
require_relative 'SimRunner'
require_relative 'ArgsChecker'
require_relative 'Car'



class City_Sim_9006_Test < Minitest::Test
  
  
	def setup
		@s = SimRunner::new   
		@c = Car::new
	end
	
	
  def test_sim_is_sim
    assert @s.is_a?(SimRunner)
  end

  def test_sim_new_not_nil
    
    refute_nil @s
	
  end

  
  
  
  #UNIT TESTS FOR METHOD check_args(array)
  #Equivalance classes:
  #array length 0 -> error
  #length 1 valid input: returns that valid input 
  #length 1 invalid input -> returns 0
  #length > 1 -> error
  
  
  #This unit test checks what happens when no args are provided
  #it should raise an error
  #EDGE CASE 
  
  
  def test_raises_error_when_no_args
		assert_raises "Enter a single seed number" do
			args = []
			checker = ArgsChecker::new
			checker.check_args args
		end
	end
	
	
	#when a valid argument is entered, it is returned by check_args
	def test_parse_valid_arg
		validArray = [5]
		checker = ArgsChecker::new		
		assert_equal 5, checker.check_args(validArray)
	end
	
	
	#check args returns 0 for invalid input
	#EDGE CASE
	def test_parse_invalid_arg
		validArray = ["foo"]
		checker = ArgsChecker::new		
		assert_equal 0, checker.check_args(validArray)
	end
	
 #This unit test checks what happens when more than one arg is provided
  #it should raise an error
  #EDGE CASE 
	
	
	def test_raises_error_when_two_args
		assert_raises "Enter a single seed number" do
			args = [1, 2]
			checker = ArgsChecker::new
			checker.check_args args
		end
	end
  
  
	#UNIT TEST FOR METHOD updateLocation(leaving, r)
	#leaving is the position the car leaves from (0 = hospital, 1= cathedral, 2 = hillman, 3 = museum)
	#r is a random number 0 or 1. 1 indicates a vertical change while 0 indicates a horizontal change
	
	#These tests are dependent on the "driveTo" methods returning correctly
	
	#these tests ensure location is updated correctly 
	
	def test_hospital_to_cathedral
	
		assert_equal 1, @c.updateLocation(0,0)
	
	end 
	
	def test_hospital_to_hillman
	
		assert_equal 2, @c.updateLocation(0,1)
	
	end 
	
	def test_cathy_to_monroeville
	
		assert_equal -2, @c.updateLocation(1,0)
	
	end 
	
	def test_cathy_to_museum
	
		assert_equal 3, @c.updateLocation(1,1)
	
	end 
	
	def test_hillman_to_downtown
	
		assert_equal -1, @c.updateLocation(2,0)
	
	end 
	
	def test_hillman_to_hospital
	
		assert_equal 0, @c.updateLocation(2,1)
	
	end 
	
	def test_museum_to_hillman
	
		assert_equal 2, @c.updateLocation(3,0)
	
	end 
	
	def test_museum_to_cathedral
	
		assert_equal 1, @c.updateLocation(3,1)
	
	end 
	
	
	
	#UNIT TESTS FOR METHOD checkForLoot(location)
	#these tests verity that the method increment or multiply counters when the car arrives at 
	#the correct destination
	
	
	#this test ensures that the counters start at the right values
	
	def test_no_new_loot
	
		assert_equal @c.books, 0
		assert_equal @c.toys, 0
		assert_equal @c.classes, 1
	
	end
	
	
	#ensures going to museum updates toys
	def test_loot_one_museum
	
		@c.checkForLoot 3
		assert_equal @c.books, 0
		assert_equal @c.toys, 1
		assert_equal @c.classes, 1
	
	end
	
	#ensures going to library twice updates toys
	def test_loot_two_library
	
		@c.checkForLoot 2
		@c.checkForLoot 2
		assert_equal @c.books, 2
		assert_equal @c.toys, 0
		assert_equal @c.classes, 1
	
	end
	
	#ensures going to classes thrice multiplys toys
	def test_loot_three_cathy
	
		@c.checkForLoot 1
		@c.checkForLoot 1
		@c.checkForLoot 1
		assert_equal @c.books, 0
		assert_equal @c.toys, 0
		assert_equal @c.classes, 8
	
	end
	
	
	#UNIT TESTS FOR "driveTo" methods
	#ensure drive through methods return proper location
	
	def test_to_cathy
		assert_equal 1, @c.driveToCathedral(1)
	end
	
	def test_to_hillman
		assert_equal 2, @c.driveToHillman(1)
	end
	
	def test_to_hospital
		assert_equal 0, @c.driveToHospital(1)
	end
	
	def test_to_museum
	
		assert_equal 3, @c.driveToMuseum(1)
	end
	
	def test_to_monroeville
	
		assert_equal -2, @c.exitMonroeville
	end
	
	def test_to_downtown
	
		assert_equal -1, @c.exitDowntown
	end
	
	
	#UNIT TESTS FOR exitStats
	#ensure correct singular or plural form of stats
	
	def test_zero_one_two_loot
	
		@c.checkForLoot 3
		@c.checkForLoot 1
		@c.checkForLoot 1
		assert_output("Driver -1 obtained 0 books!\nDriver -1 obtained 1 dinosaur toy!\nDriver -1 attended 4 classes!\n") { @c.exitStats }
	end
	
  
end
