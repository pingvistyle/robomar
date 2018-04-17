require 'spec_helper'

describe Robomar::Plateau do

  it 'Create plateau' do
    expect(Robomar::Plateau.new(6,6).size).to eq([6,6])
  end

  it 'Check raise error if set incorrection args' do
    expect{Robomar::Plateau.new(6)}.to raise_error(ArgumentError)
  end

  it 'Check raise error if set incorrection size' do
    expect{Robomar::Plateau.new(-1,6).size}.to raise_error(Robomar::IncorrectionSizePlateau)
  end
end

