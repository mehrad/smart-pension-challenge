# frozen_string_literal: true

require_relative '../lib/error_pronable'
# Args service reader wich looks for first args
# Validates args to have exactly on arguments
class ArgsReaderService
  include ErrorPronable
  attr_reader :path

  def initialize(args)
    @errors = []
    fetch_path(args)
  end

  private

  def fetch_path(args)
    if args.nil? || args.size != 1 || args[0].nil?
      @errors << bad_argument_error
      return
    end
    @path = args[0]
  end

  def bad_argument_error
    <<~ERROR
      Please proive proper entry
      ./parser.rb logs/webserver.log
    ERROR
  end
end
