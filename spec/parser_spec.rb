# frozen_string_literal: true

require 'spec_helper'
require './parser'

# This test wroks as an intergarion test
describe 'parser' do
  subject { system "./parser.rb #{arguments}" }

  context 'when file is found' do
    let(:arguments) { 'spec/fixtures/sample_webserver.log' }
    let(:sample_output) do
      <<~OUT

        visit counts:
        /home 3 visits
        /about/2 1 visit

        unique views:
        /home 2 unique views
        /about/2 1 unique view
      OUT
    end

    it 'runs' do
      expect { subject }.to output(
        sample_output
      ).to_stdout_from_any_process
    end
  end

  context 'when file can not be found' do
    let(:arguments) { ['bad_path'] }

    it 'errors' do
      expect { subject }.to output("File does not exist at [bad_path]\n").to_stderr_from_any_process
    end
  end

  context 'when arg is empty' do
    let(:arguments) { nil }

    it 'errors' do
      expect { subject }.to output.to_stderr_from_any_process
    end
  end
end
