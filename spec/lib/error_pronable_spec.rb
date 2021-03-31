# frozen_string_literal: true

require 'spec_helper'
require_relative '../../lib/error_pronable'

# Dummy class just for testing
class Dummy
  include ErrorPronable
end

describe Dummy do
  subject { Dummy.new }
  it { is_expected.to respond_to(:valid?) }
end
