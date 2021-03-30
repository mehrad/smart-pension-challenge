# frozen_string_literal: true

require 'spec_helper'
require_relative '../../services/args_reader_service'

describe ArgsReaderService do
  subject { described_class.new(arguments) }
  context 'with only one arg' do
    let(:arguments) { ['first_arg'] }

    it 'returns first argument as path' do
      expect(subject.path).to eq(arguments.first)
    end

    it 'returns no error' do
      expect(subject.valid?).to be true
    end
  end
  context 'with two args' do
    let(:arguments) { %w[first_arg second_arg] }

    it 'returns empty path' do
      expect(subject.path).to be_nil
    end

    it 'returns errors' do
      expect(subject.valid?).to be false
    end
  end
  context 'with no args' do
    let(:arguments) { nil }

    it 'returns empty path' do
      expect(subject.path).to be_nil
    end

    it 'returns errors' do
      expect(subject.valid?).to be false
    end
  end
end
