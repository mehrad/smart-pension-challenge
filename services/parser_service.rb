# frozen_string_literal: true

# Main parser class to run our job
class ParserService
  attr_reader :errors

  def initialize(parse_path:, file_service:, storage:, printer:)
    @errors = []
    @file_service = file_service
    @storage = storage
    @printer = printer

    @file_service.fetch_data(parse_path)
    @errors = file_service.errors
  end

  def run
    populate_storage(file_service)
    printer.print_visit_count(storage.visit_count)
    printer.print_unique_visit_count(storage.unique_visit_count)
  end

  def valid?
    errors.size.zero?
  end

  private

  attr_reader :path, :storage, :file_service, :printer

  def populate_storage(file_service)
    file_service.each_line do |page, ip|
      storage << { page: page, ip: ip }
    end
  end
end
