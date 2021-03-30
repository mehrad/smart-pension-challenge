# frozen_string_literal: true

require 'spec_helper'
require_relative '../../services/printer_service'

describe PrinterService do
  subject { described_class.new }
  let(:visit_counts) do
    [
      ['page', 1],
      ['other_page', 2]
    ]
  end

  let(:unique_visit_counts) do
    [
      ['page', 1],
      ['other_page', 2]
    ]
  end

  let(:visit_counts_output) do
    <<~OUT

      visit counts:
      other_page 2 visits
      page 1 visit
    OUT
  end

  let(:unique_visit_counts_output) do
    <<~OUT

      unique views:
      other_page 2 unique views
      page 1 unique view
    OUT
  end

  it 'expect to print sorted visit counts with proper format' do
    expect do
      subject.print_visit_count(visit_counts)
    end.to output(visit_counts_output).to_stdout
  end

  it 'expect to print sorted unique visit counts with proper format' do
    expect do
      subject.print_unique_visit_count(unique_visit_counts)
    end.to output(unique_visit_counts_output).to_stdout
  end
end
