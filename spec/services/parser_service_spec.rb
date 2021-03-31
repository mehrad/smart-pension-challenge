# frozen_string_literal: true

require 'spec_helper'
require './services/parser_service'

describe ParserService do
  let(:parse_path) { 'some_path_to_log' }
  let(:file_service) { double(:file_service) }
  let(:storage) { double(:storage) }
  let(:printer) { double(:printer) }

  subject do
    described_class.new(
      parse_path: parse_path,
      file_service: file_service,
      storage: storage,
      printer: printer
    )
  end

  context '#run' do
    before do
      allow(file_service).to receive(:errors).and_return([])
      allow(file_service).to receive(:fetch_data)
      allow(file_service).to receive(:each_line)
        .and_yield('/page', '127.0.0.1')
        .and_yield('/page', '127.0.0.1')

      allow(printer).to receive(:print_unique_visit_count)
      allow(printer).to receive(:print_visit_count)

      allow(storage).to receive(:<<).twice
      allow(storage).to receive(:visit_count).and_return([['/page', 2]])
      allow(storage).to receive(:unique_visit_count).and_return([['/page', 2]])
    end
    it 'sends messages to file service' do
      expect(file_service).to receive(:errors).and_return([])
      expect(file_service).to receive(:fetch_data)
      expect(file_service).to receive(:each_line)
        .and_yield('/page', '127.0.0.1')
        .and_yield('/page', '127.0.0.1')
      subject.run
    end
    it 'sends messages to storage' do
      expect(storage).to receive(:<<).twice
      expect(storage).to receive(:visit_count).and_return([['/page', 2]])
      expect(storage).to receive(:unique_visit_count).and_return([['/page', 2]])
      subject.run
    end
    it 'sends messages to printer' do
      expect(printer).to receive(:print_unique_visit_count)
      expect(printer).to receive(:print_visit_count)
      subject.run
    end

    it 'reutrns valid' do
      expect(subject.valid?).to be true
    end
  end
end
