# frozen_string_literal: true

require 'spec_helper'
require_relative '../../services/file_service'

describe FileService do
  subject { described_class.new }
  before { subject.fetch_data(path) }

  context 'with proper file' do
    let(:path) { 'spec/fixtures/sample_webserver.log' }
    it 'yields splited line' do
      expect { |l| subject.each_line(&l) }.to yield_successive_args(
        ['/about/2', '444.701.448.104'],
        ['/home', '184.123.665.067'],
        ['/home', '235.313.352.950'],
        ['/home', '184.123.665.067']
      )
    end

    it 'is valid' do
      expect(subject.valid?).to be true
    end
  end
  context 'with corrupted file' do
    let(:path) { 'spec/fixtures/corrupted_webserver.log' }

    it 'yields splited correct lines' do
      expect { |l| subject.each_line(&l) }.to yield_successive_args(
        ['/home', '184.123.665.067']
      )

      expect(subject.valid?).to be false
      expect(subject.errors.first).to eq('Log is corrupted at 0')
    end
  end

  context 'with empty file' do
    let(:path) { 'spec/fixtures/empty_webserver.log' }

    it 'returns error' do
      subject
      expect(subject.valid?).to be false
      expect(subject.errors.first).to eq('Log is empty at spec/fixtures/empty_webserver.log')
    end
  end

  context 'with no file' do
    let(:path) { 'spec/fixtures/dont_exist.log' }

    it 'returns error' do
      subject
      expect(subject.valid?).to be false
      expect(subject.errors.first).to eq('File does not exist at spec/fixtures/dont_exist.log')
    end
  end
end
