describe Robomar::Robot do

  it 'Create Robot' do
    p = Robomar::Plateau.new(6,6)
    expect(Robomar::Robot.new(p, 1, 1, :N).state).to eq([1, 1, :N])
  end

  it 'Check raise error if set incorrection args' do
    p = Robomar::Plateau.new(6,6)
    expect{Robomar::Robot.new(p, 1, 1)}.to raise_error(ArgumentError)
  end

  it 'Check raise error if set incorrection position' do
    p = Robomar::Plateau.new(6,6)
    expect{Robomar::Robot.new(p, -1, 1, :N)}.to raise_error(Robomar::IncorrectionPositionRobot)
  end

  it 'Check raise error if set incorrection direction' do
    p = Robomar::Plateau.new(6,6)
    expect{Robomar::Robot.new(p, 1, 1, :ASDF)}.to raise_error(Robomar::IncorrectionDirectionRobot)
  end

  it 'Turn right/left' do
    p = Robomar::Plateau.new(6,6)
    expect(Robomar::Robot.new(p, 1, 1, :N).programming('R').state).to eq([1, 1, :E])
    expect(Robomar::Robot.new(p, 1, 1, :N).programming('L').state).to eq([1, 1, :W])
  end

  it 'Move' do
    p = Robomar::Plateau.new(6,6)
    expect(Robomar::Robot.new(p, 1, 1, :N).programming('M').state).to eq([1, 2, :N])
    expect(Robomar::Robot.new(p, 1, 1, :E).programming('M').state).to eq([2, 1, :E])
    expect(Robomar::Robot.new(p, 1, 1, :S).programming('M').state).to eq([1, 0, :S])
    expect(Robomar::Robot.new(p, 1, 1, :W).programming('M').state).to eq([0, 1, :W])
  end

  it 'Outarea' do
    p = Robomar::Plateau.new(6,6)
    expect{Robomar::Robot.new(p, 7, 1, :N)}.to raise_error(Robomar::OutareaRobot)
    expect{Robomar::Robot.new(p, 1, 5, :N).programming('MM')}.to raise_error(Robomar::OutareaRobot)
  end

  it 'Programming' do
    p = Robomar::Plateau.new(6,6)
    expect(Robomar::Robot.new(p, 1, 1, :N).programming("MMM").state).to eq([1, 4, :N])
    expect(Robomar::Robot.new(p, 1, 1, :N).programming("MMMRMMMLMMLL").state).to eq([4, 6, :S])
    expect{Robomar::Robot.new(p, 1, 5, :N).programming('MXM')}.to raise_error(Robomar::IncorrectlyCommandRobot)    
  end

end
  
