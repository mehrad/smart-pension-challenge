# frozen_string_literal: true

require_relative '../lib/error_pronable'
# Main parser class to run our job
class ParserService
  include ErrorPronable

  def initialize(parse_path:, file_service:, storage:, printer:)
    @errors = []
    @file_service = file_service
    @storage = storage
    @printer = printer

    @file_service.fetch_data(parse_path)
    @errors = file_service.errors unless file_service.valid?
  end

  def run
    populate_storage(file_service)
    printer.print_visit_count(storage.visit_count)
    printer.print_unique_visit_count(storage.unique_visit_count)
  end

  private

  attr_reader :storage, :file_service, :printer

  def populate_storage(file_service)
    file_service.each_line do |page, ip|
      storage << { page: page, ip: ip }
    end
  end
end
