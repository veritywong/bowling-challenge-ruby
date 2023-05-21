require 'bowling'

RSpec.describe 'bowling' do

    context 'first frame with no strike or spare' do
        it 'does not add any bonus points' do
            io = double :io
            
            expect(io).to receive(:puts).with('number of knocked down pins?')
            expect(io).to receive(:gets).and_return(2)
            expect(io).to receive(:puts).with('frame: 1')
            expect(io).to receive(:puts).with('running total: 2')

            bowling = Bowling.new(io, 1, 0)
            bowling.score
            
        end
    end

    context 'second frame with no strike or spare' do
        it 'does not add any bonus points' do
            io = double :io
            
            expect(io).to receive(:puts).with('number of knocked down pins?')
            expect(io).to receive(:gets).and_return(2)
        
            expect(io).to receive(:puts).with('frame: 2')
            expect(io).to receive(:puts).with('running total: 4')

            bowling = Bowling.new(io, 2, 2)
            bowling.score
            
        end
    end

    context 'when strike on previous frame' do
        it 'adds extra score for current frame' do
            io = double :io
            
            expect(io).to receive(:puts).with('number of knocked down pins?')
            expect(io).to receive(:gets).and_return(2) 
            expect(io).to receive(:puts).with("first roll score?")
            expect(io).to receive(:gets).and_return(1)
            expect(io).to receive(:puts).with('frame: 2')
            expect(io).to receive(:puts).with('running total: 14')

            bowling = Bowling.new(io, 2, 10)
            bowling.score_when_strike_on_previous_frame
        end
    end

    context '10th frame with perfect score' do
        it 'totals to 300' do
            io = double :io

            expect(io).to receive(:puts).with('number of knocked down pins?')
            expect(io).to receive(:gets).and_return(10)
            expect(io).to receive(:puts).with("first roll score?")
            expect(io).to receive(:gets).and_return(10)
            expect(io).to receive(:puts).with("second roll score?")
            expect(io).to receive(:gets).and_return(10)
            expect(io).to receive(:puts).with('frame: 10')
            expect(io).to receive(:puts).with('running total: 300')
  
            bowling = Bowling.new(io, 10, 270)
            bowling.score_when_strikes_in_a_row
        end
    end

    context 'when spare' do
        it 'doubles score of first bowl of next frame' do
            io = double :io
            
            expect(io).to receive(:puts).with('number of knocked down pins?')
            expect(io).to receive(:gets).and_return(2)
            expect(io).to receive(:puts).with("first roll score?")
            expect(io).to receive(:gets).and_return(2)
            expect(io).to receive(:puts).with('frame: 2')
            expect(io).to receive(:puts).with('running total: 14')

            bowling = Bowling.new(io, 2, 10)
            bowling.score_when_spare_on_previous_frame
        end
    end


end
