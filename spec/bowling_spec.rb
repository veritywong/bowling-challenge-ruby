require 'bowling'

RSpec.describe 'bowling' do

    context 'first frame with no strike or spare' do
        it 'does not add any bonus points' do
            io = double :io
            
            expect(io).to receive(:puts).with("number of rolls?")
            expect(io).to receive(:gets).and_return(2)
            expect(io).to receive(:puts).with('number of knocked down pins?')
            expect(io).to receive(:gets).and_return(2)
            expect(io).to receive(:puts).with('strike on last frame?')
            expect(io).to receive(:gets).and_return('no')
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
            expect(io).to receive(:puts).with('strike on last frame?')
            expect(io).to receive(:gets).and_return('no')
            expect(io).to receive(:puts).with('frame: 2')
            expect(io).to receive(:puts).with('running total: 4')

            bowling = Bowling.new(io)
            bowling.game(2, 2)
            
        end
    end

    context 'when strike' do
        it 'does doubles score of next frame' do
            io = double :io
            
            expect(io).to receive(:puts).with("number of rolls?")
            expect(io).to receive(:gets).and_return(2)
            expect(io).to receive(:puts).with('number of knocked down pins?')
            expect(io).to receive(:gets).and_return(2)
            expect(io).to receive(:puts).with('strike on last frame?')
            expect(io).to receive(:gets).and_return('yes')
            expect(io).to receive(:puts).with('frame: 2')
            expect(io).to receive(:puts).with('running total: 14')

            bowling = Bowling.new(io)
            bowling.game(2, 10)
        end
    end

end
