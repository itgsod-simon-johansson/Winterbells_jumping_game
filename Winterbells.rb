require 'chingu'

class Game < Chingu::Window

	def initialize
		super 800, 640
		@player = Player.create
		self.input = {esc: :exit}
		@bells = []
		5.times {@bells << Bells.create}
	end


end

class Player < Chingu::GameObject


	#meta-constructor
	def setup
		@x, @y = 450, 620
		@image = Gosu::Image["bunnyjumping2.png"]
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
		@x = rand(800)	
		@y = rand(640)	
		@image = Gosu::Image["Bells.png"]
	end
end

Game.new.show