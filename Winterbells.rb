require 'chingu'

class Game < Chingu::Window

	def initialize
		super 800, 640
		@player = Player.create
		Map.new
		self.input = {esc: :exit}
		@bells = []
		# 5.times {@bells << Bells.create}
	end


end

class Player < Chingu::GameObject


	#meta-constructor
	def setup
		@x, @y = 450, 620
		@image = Gosu::Image["bunnyjumping1.png"]
		self.input = {
			holding_left: :left,
			holding_right: :right,
		}
	end

	def left
		unless @x - 20 <= 0
			@x -= 10

		end
	end

	def right
		unless @x + 20 >= 800
			@x += 10
		end
	end


end

class Bells < Chingu::GameObject
	has_traits :collision_detection, :bounding_circle

	def setup
		@image = Gosu::Image["Bells.png"]
	end

	def update
		super
	end
end

class Bird < Chingu::GameObject
	has_traits :collision_detection, :bounding_circle

	def setup
		@image = Gosu::Image["Birdy.png"]
	end
end



class Map 

	def initialize
		y = 0
		File.readlines("testmap.txt").each do |row|
			x = 0
			tecken = row.split("")
			tecken.each do |t|
				puts t
				if t == "0"
					x += 20
				elsif t == "1"
					Bells.create(x: x, y: y)
					x += 20

				elsif t == "2"
					Bird.create(x: x, y: y)
					x += 20
				end
			end
			y += 20	
		end
	end
end

Game.new.show