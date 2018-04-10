describe Robot do

  it 'Create Robot' do
    p = Plateau.new(6,6)
    expect(Robot.new(p, 1, 1, :N).state).to eq([1, 1, :N])
  end

  it 'Check raise error if set incorrection args' do
    Plateau.new(6,6)
    expect{Robot.new(p, 1, 1)}.to raise_error(ArgumentError)
  end

  it 'Check raise error if set incorrection position' do
    Plateau.new(6,6)
    expect{Robot.new(p, -1, 1, :N)}.to raise_error("Incorrection position!")
  end

  it 'Check raise error if set incorrection side' do
    Plateau.new(6,6)
    expect{Robot.new(p, 1, 1, :ASDF)}.to raise_error("Incorrection side!")
  end

  it 'Turn right/left' do
    p = Plateau.new(6,6)
    expect(Robot.new(p, 1, 1, :N).right.state).to eq([1, 1, :E])
    expect(Robot.new(p, 1, 1, :N).left.state).to eq([1, 1, :W])
  end

  it 'Move' do
    p = Plateau.new(6,6)
    expect(Robot.new(p, 1, 1, :N).move.state).to eq([1, 2, :N])
    expect(Robot.new(p, 1, 1, :E).move.state).to eq([2, 1, :E])
    expect(Robot.new(p, 1, 1, :S).move.state).to eq([1, 0, :S])
    expect(Robot.new(p, 1, 1, :W).move.state).to eq([0, 1, :W])
  end

  it 'Outside' do
    p = Plateau.new(6,6)
    expect{Robot.new(p, 7, 1, :N)}.to raise_error("Robot outside plateau!")
    expect{Robot.new(p, 1, 5, :N).move.move}.to raise_error("Robot outside plateau!")
  end

  it 'Programming' do
    p = Plateau.new(6,6)
    expect(Robot.new(p, 1, 1, :N).programming("MMM").state).to eq([1, 4, :N])
    expect(Robot.new(p, 1, 1, :N).programming("MMMRMMMLMMLL").state).to eq([4, 6, :S])
  end

end
  