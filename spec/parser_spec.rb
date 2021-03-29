# frozen_string_literal: true

require 'spec_helper'
require './parser'

describe Parser do
  subject { described_class.new(arguments).run }

  context 'when file is found' do
    let(:arguments) { ['spec/fixtures/sample_webserver.log'] }
    it 'runs' do
      subject
    end
  end
end
