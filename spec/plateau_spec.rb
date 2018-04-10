require 'spec_helper'

describe Plateau do

  it 'Create plateau' do
    expect(Plateau.new(6,6).size).to eq([6,6])
  end

  it 'Check raise error if set incorrection args' do
    expect{Plateau.new(6)}.to raise_error(ArgumentError)
  end

  it 'Check raise error if set incorrection size' do
    expect{Plateau.new(-1,6).size}.to raise_error("Incorrection size!")
  end
end

