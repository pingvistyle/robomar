require 'spec_helper'

describe Robomar do
  it 'has a version number' do
    expect(Robomar::VERSION).not_to be nil
  end

  it 'Create plateau' do
    expect(Robomar.create_plateau("6 6").size).to eq([6, 6])
    expect(Robomar.create_plateau(" 6   6\n").size).to eq([6, 6])
  end
  
  it 'Create robot' do
    p = Robomar.create_plateau("6 6")
    expect(Robomar.create_robot(p, "1 1 N").state).to eq([1, 1, :N])
    expect{Robomar.create_robot(p, " 7   1 N\n")}.to raise_error("Robot outside plateau!")
  end

  it 'Run' do
    expect(Robomar.run("./spec/instruction_file.txt")).to eq([[3, 2, :S], [2, 5, :W]])
  end
end

