require 'spec_helper'

describe FactorialOperations do
  subject { FactorialOperations.new }

  it 'has a version number' do
    expect(FactorialOperations::VERSION).not_to be nil
  end

  describe '#calculate' do
    let(:input) { 6 }
    let(:output) { FactorialOperations.calculate(input) }

    it 'is a number' do
      expect(input.to_i.to_s).to eq("6")
    end

    it 'calculates' do
      expect(output).to eq 720
    end
  end

  describe '#factorial_to_s' do
    let(:input) { 6 }
    let(:output) { FactorialOperations.factorial_to_s(input) }

    it 'is a number' do
      expect(input.to_i.to_s).to eq("6")
    end

    it 'generates a string' do
      expect(output).to eq "6*5*4*3*2*1"
    end
  end
end