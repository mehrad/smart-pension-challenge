# frozen_string_literal: true

require 'spec_helper'
require_relative '../../services/exception_service'

describe ExceptionService do
  subject { described_class.throw_exception(msg, exit: false) }
  let(:msg) { 'msg' }

  specify { expect { subject }.to output("#{msg}\n").to_stderr }
end
