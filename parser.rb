#!/usr/bin/env ruby
# frozen_string_literal: true

require './services/parser_service'
require_relative './services/args_reader_service'
require_relative './services/file_service'
require_relative './services/storage_service'
require_relative './services/exception_service'
require_relative './services/printer_service'

if $PROGRAM_NAME == __FILE__

  args_reader = ArgsReaderService.new(ARGV)

  ExceptionService.throw_exception(args_reader.errors) unless args_reader.valid?

  parser_service = ParserService.new(
    parse_path: args_reader.path,
    file_service: FileService.new,
    storage: StorageService.new,
    printer: PrinterService.new
  )

  ExceptionService.throw_exception(parser_service.errors) unless parser_service.valid?

  parser_service.run

end
