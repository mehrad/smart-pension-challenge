# frozen_string_literal: true

# File reader service which returns iteratable object containing page and ip
# Morever handles empty, corrupted or bad path
class FileService
  attr_reader :errors, :file_handle

  def initialize(path)
    @errors = []
    unless File.exist?(path)
      @errors << "File does not exist at #{path}"
      return
    end

    @file_handle = File.open(path, 'r')
    @errors << "Log is empty at #{path}" if @file_handle.size.zero?
  end

  def each_line
    file_handle.each_line.with_index do |line, index|
      page, ip = line.split
      unless proper_ip?(ip)
        @errors << "Log is corrupted at #{index}"
        next
      end
      yield page, ip
    end
  end

  private

  def proper_ip?(ip)
    !ip.nil? && ip.match(/^([0-9]+(\.|$)){4}/)
  end
end
