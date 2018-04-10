describe Robot do

  it 'Create Robot' do
    expect(Robot.new(1, 1, :N).state).to eq([1, 1, :N])
  end

  it 'Check raise error if set incorrection args' do
    expect{Robot.new(1, 1)}.to raise_error(ArgumentError)
  end

  it 'Check raise error if set incorrection position' do
    expect{Robot.new(-1, 1, :N)}.to raise_error("Incorrection position!")
  end

  it 'Check raise error if set incorrection side' do
    expect{Robot.new(1, 1, :ASDF)}.to raise_error("Incorrection side!")
  end

  it 'Turn right/left' do
    expect(Robot.new(1, 1, :N).right.state).to eq([1, 1, :E])
    expect(Robot.new(1, 1, :N).left.state).to eq([1, 1, :W])
  end

  it 'Move' do
    expect(Robot.new(1, 1, :N).move.state).to eq([1, 2, :N])
    expect(Robot.new(1, 1, :E).move.state).to eq([2, 1, :E])
    expect(Robot.new(1, 1, :S).move.state).to eq([1, 0, :S])
    expect(Robot.new(1, 1, :W).move.state).to eq([0, 1, :W])
  end
end
  