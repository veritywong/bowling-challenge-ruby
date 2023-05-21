class Bowling

    def initialize(io, frame, last_score)
        @io = io
        @frame = frame.to_i
        @running_total = [last_score]
    end

    
    def score
        current_score?
        @running_total << @knocked_down_pins
        @io.puts "frame: #{@frame}"
        @io.puts "running total: #{@running_total.sum}"
    end

    def score_when_strike_on_previous_frame
        current_score?

        @io.puts "first roll score?"
        first_score = @io.gets.to_i
        second_score = @knocked_down_pins - first_score

        @running_total << (@knocked_down_pins + first_score + second_score)
        @io.puts "frame: #{@frame}"
        @io.puts "running total: #{@running_total.sum}"
    end

    def score_when_strikes_in_a_row
        current_score?

        @io.puts "first roll score?"
        first_score = @io.gets.to_i
        @io.puts "second roll score?"
        second_score = @io.gets.to_i

        @running_total << (@knocked_down_pins + first_score + second_score)
        @io.puts "frame: #{@frame}"
        @io.puts "running total: #{@running_total.sum}"
    end

    def score_when_last_frame_spare
        current_score?

        @io.puts "first roll score?"
        first_score = @io.gets.to_i

        @running_total << (@knocked_down_pins + first_score)
        @io.puts "frame: #{@frame}"
        @io.puts "running total: #{@running_total.sum}"
    end

    private

    def current_score?
        @io.puts 'number of knocked down pins?'
        @knocked_down_pins = @io.gets.to_i
    end

end

