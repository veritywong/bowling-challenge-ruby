require 'bowling'

RSpec.describe 'bowling' do

    context 'first frame with no strike or spare' do
        it 'does not add any bonus points' do
            io = double :io
            
            expect(io).to receive(:puts).with("number of rolls?")
            expect(io).to receive(:gets).and_return(2)
            expect(io).to receive(:puts).with('number of knocked down pins?')
            expect(io).to receive(:gets).and_return(2)
            expect(io).to receive(:puts).with('frame: 1')
            expect(io).to receive(:puts).with('running total: 2')

            bowling = Bowling.new(io)
            bowling.game(1,0)
            
        end
    end

    context 'second frame with no strike or spare' do
        it 'does not add any bonus points' do
            io = double :io
            
            expect(io).to receive(:puts).with("number of rolls?")
            expect(io).to receive(:gets).and_return(2)
            expect(io).to receive(:puts).with('number of knocked down pins?')
            expect(io).to receive(:gets).and_return(2)

            expect(io).to receive(:puts).with("previous frame rolls?")
            expect(io).to receive(:gets).and_return(2)
            expect(io).to receive(:puts).with("previous frame score?")
            expect(io).to receive(:gets).and_return(2)              

            expect(io).to receive(:puts).with('frame: 2')
            expect(io).to receive(:puts).with('running total: 4')

            bowling = Bowling.new(io)
            bowling.game(2, 2)
            
        end
    end

    context 'when strike' do
        it 'doubles score of next frame' do
            io = double :io
            
            expect(io).to receive(:puts).with("number of rolls?")
            expect(io).to receive(:gets).and_return(2)
            expect(io).to receive(:puts).with('number of knocked down pins?')
            expect(io).to receive(:gets).and_return(2)
            expect(io).to receive(:puts).with("previous frame rolls?")
            expect(io).to receive(:gets).and_return(1)
            expect(io).to receive(:puts).with("previous frame score?")
            expect(io).to receive(:gets).and_return(10)   
            expect(io).to receive(:puts).with('frame: 2')
            expect(io).to receive(:puts).with('running total: 16')

            bowling = Bowling.new(io)
            bowling.game(2, 10)
        end
    end

    context 'when spare' do
        it 'doubles score of first bowl of next frame' do
            io = double :io
            
            expect(io).to receive(:puts).with("number of rolls?")
            expect(io).to receive(:gets).and_return(2)
            expect(io).to receive(:puts).with('number of knocked down pins?')
            expect(io).to receive(:gets).and_return(2)
            expect(io).to receive(:puts).with("previous frame rolls?")
            expect(io).to receive(:gets).and_return(2)
            expect(io).to receive(:puts).with("previous frame score?")
            expect(io).to receive(:gets).and_return(10)
            expect(io).to receive(:puts).with("first roll score?")
            expect(io).to receive(:gets).and_return(2)
            expect(io).to receive(:puts).with('frame: 2')
            expect(io).to receive(:puts).with('running total: 14')

            bowling = Bowling.new(io)
            bowling.game(2, 10)
        end
    end

    context '10th frame with perfect score' do
        it 'totals to 300' do
            io = double :io
            
            expect(io).to receive(:puts).with("number of rolls?")
            expect(io).to receive(:gets).and_return(1)
            expect(io).to receive(:puts).with('number of knocked down pins?')
            expect(io).to receive(:gets).and_return(10)
            expect(io).to receive(:puts).with("previous frame rolls?")
            expect(io).to receive(:gets).and_return(1)
            expect(io).to receive(:puts).with("previous frame score?")
            expect(io).to receive(:gets).and_return(10)
            expect(io).to receive(:puts).with('frame: 10')
            expect(io).to receive(:puts).with('running total: 300')
  
            bowling = Bowling.new(io)
            bowling.game(10, 270)
        end
    end

end
