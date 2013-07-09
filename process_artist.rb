require 'ruby-processing'
class ProcessArtist < Processing::App
	#this is my first change im so excited yay!
	
	
	def setup
		background(128, 0, 128)
		@size = 10
		@queue = ""

	end

	def draw
	
	end
	def mouse_pressed
		warn "Mouse was pressed"
	end
	
	def mouse_dragged
		stroke(rand(255),rand(255),rand(255))
		fill(rand(255),rand(255),rand(255))
		case @shape
		when "s1" then oval(mouse_x, mouse_y, @size, @size)
		when "s2" then oval(mouse_x, mouse_y, @size * 2, @size)
		when "s3" then oval(mouse_x, mouse_y, @size, @size * 2)
		when "s4" then rect(mouse_x, mouse_y, @size, @size)
		when "s5" then rect(mouse_x, mouse_y, @size * 4, @size)
		when "s6" then rect(mouse_x, mouse_y, @size, @size * 4)
		when "s7" then rect(mouse_x, mouse_y, @size * 2,@size )
									 rect(mouse_x, mouse_y, @size, @size * 2)
		else
			warn "i dont know that command"
		end
	end
	
	def mouse_released
		warn "The mouse has been released"
	end
	def key_pressed
		warn "A key was pressed! #{key.inspect}"
  	if key == "+"
    	@size += 10
    elsif key == "-"
    	@size -= 10
  	elsif key != "\n"
    	@queue += key
    else
    	warn "Time to run the command: #{@queue}"
    	run_command(@queue)
			@shape = @queue
			@queue = ""
  	end
	end
	def run_command(command)
		puts "Running Command #{command}"
  	if command.start_with?("b")
  		color = command[1..-1]
  		colors_split = color.split(",")
  		background(colors_split[0].to_i, colors_split[1].to_i, colors_split[2].to_i)
  	end
  	if command.start_with?("f")
  		color = command[1..-1]
  		colors_split = color.split(",")
  		fill(colors_split[0].to_i, colors_split[1].to_i, colors_split[2].to_i)
  	end
	end
end
ProcessArtist.new(:width => 600, :height => 700,
	:title => "ProcessArtist", :full_screen => false)
