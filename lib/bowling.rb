class Bowling

    def initialize(io)
        @io = io
    end

    
    def game(frame, current_score)
        @frame = frame.to_i
        @running_total = [current_score]

        @io.puts "number of rolls?"
        number_of_rolls = @io.gets.to_i
        @io.puts 'number of knocked down pins?'
        @knocked_down_pins = @io.gets.to_i

        if @frame > 1
            @io.puts "previous frame rolls?"
            previous_frame_rolls = @io.gets.to_i
            @io.puts "previous frame score?"
            previous_frame_score = @io.gets.to_i
                
            if previous_frame_rolls == 1 && previous_frame_score == 10
                @running_total << (@knocked_down_pins * 3)
                @io.puts "frame: #{@frame}"
                @io.puts "running total: #{@running_total.sum}"

            elsif previous_frame_rolls == 2 && previous_frame_score == 10
                @io.puts "first roll score?"
                first_score = @io.gets.to_i

                @running_total << (@knocked_down_pins + first_score)
                @io.puts "frame: #{@frame}"
                @io.puts "running total: #{@running_total.sum}"
            else
                no_bonus_score
            end
        else
            no_bonus_score
        end

    end

    private

    def no_bonus_score
        @running_total << @knocked_down_pins
        @io.puts "frame: #{@frame}"
        @io.puts "running total: #{@running_total.sum}"
    end

end

