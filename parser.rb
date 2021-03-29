# frozen_string_literal: true

# Main parser class to run our job
class Parser
  attr_accessor :log_path

  def initialize(args)
    @log_path = args
  end

  def run; end

  # Use Ruby constants to make the file runnable from the command line
  Parser.new(ARGV).run if $PROGRAM_NAME == __FILE__
end
