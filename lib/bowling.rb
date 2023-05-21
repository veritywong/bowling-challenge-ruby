class Bowling

    def initialize(io)
        @io = io
    end

    
    def game(frame, current_score)
        running_total = [current_score]

        @io.puts "number of rolls?"
        number_of_rolls = @io.gets.to_i
        @io.puts 'number of knocked down pins?'
        knocked_down_pins = @io.gets.to_i
        @io.puts "strike on last frame?"
        strike_on_last_frame = @io.gets

        if strike_on_last_frame == "yes"
            running_total << (knocked_down_pins * 2)
            @io.puts "frame: #{frame}"
            @io.puts "running total: #{running_total.sum}"
            

        else 
            # number_of_rolls > 1 && knocked_down_pins < 10
            running_total << knocked_down_pins
            @io.puts "frame: #{frame}"
            @io.puts "running total: #{running_total.sum}"
            
        end
    end

end

# game = Bowling.new(Kernel)
# game.score

