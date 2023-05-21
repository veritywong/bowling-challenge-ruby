require 'bowling'

RSpec.describe 'bowling' do

    context 'when player never scores a strike or spare' do
        it 'allows two rolls per frame with total score the sum of these rolls' do
            bowling = Bowling.new
            rolls = 2
            knocked_down_pins = 2
            score = bowling.score(2, 2)
            expect(score).to eq 2
        end

    end
end