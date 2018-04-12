describe Robot do

  it 'Create Robot' do
    p = Plateau.new(6,6)
    expect(Robot.new(p, 1, 1, :N).state).to eq([1, 1, :N])
  end

  it 'Check raise error if set incorrection args' do
    p = Plateau.new(6,6)
    expect{Robot.new(p, 1, 1)}.to raise_error(ArgumentError)
  end

  it 'Check raise error if set incorrection position' do
    p = Plateau.new(6,6)
    expect{Robot.new(p, -1, 1, :N)}.to raise_error("Incorrection position!")
  end

  it 'Check raise error if set incorrection direction' do
    p = Plateau.new(6,6)
    expect{Robot.new(p, 1, 1, :ASDF)}.to raise_error("Incorrection direction!")
  end

  it 'Turn right/left' do
    p = Plateau.new(6,6)
    expect(Robot.new(p, 1, 1, :N).programming('R').state).to eq([1, 1, :E])
    expect(Robot.new(p, 1, 1, :N).programming('L').state).to eq([1, 1, :W])
  end

  it 'Move' do
    p = Plateau.new(6,6)
    expect(Robot.new(p, 1, 1, :N).programming('M').state).to eq([1, 2, :N])
    expect(Robot.new(p, 1, 1, :E).programming('M').state).to eq([2, 1, :E])
    expect(Robot.new(p, 1, 1, :S).programming('M').state).to eq([1, 0, :S])
    expect(Robot.new(p, 1, 1, :W).programming('M').state).to eq([0, 1, :W])
  end

  it 'Outarea' do
    p = Plateau.new(6,6)
    expect{Robot.new(p, 7, 1, :N)}.to raise_error("Robot outarea plateau!")
    expect{Robot.new(p, 1, 5, :N).programming('MM')}.to raise_error("Robot outarea plateau!")
  end

  it 'Programming' do
    p = Plateau.new(6,6)
    expect(Robot.new(p, 1, 1, :N).programming("MMM").state).to eq([1, 4, :N])
    expect(Robot.new(p, 1, 1, :N).programming("MMMRMMMLMMLL").state).to eq([4, 6, :S])
  end

end
  
