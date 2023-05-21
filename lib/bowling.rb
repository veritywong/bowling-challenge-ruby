class Bowling
    def score(number_of_rolls, knocked_down_pins)
        if number_of_rolls > 1 && knocked_down_pins < 10
            return knocked_down_pins
        end
    end
end