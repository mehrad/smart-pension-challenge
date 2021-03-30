# frozen_string_literal: true

# Storage service wihch act as database
# and let us query on populated entries
class StorageService
  def initialize
    @entries = []
  end

  def count
    @entries.size
  end

  def <<(object)
    @entries << object
  end

  def visit_count
    results = Hash.new(0)
    entries.map do |el|
      results[el[:page]] += 1
    end
    results.map { |(k, v)| [k, v] }
  end

  def unique_visit_count
    results = Hash.new { |hash, key| hash[key] = Hash.new(0) }
    entries.each do |el|
      results[el[:page]][el[:ip]] += 1
    end
    results.map { |(k, v)| [k, v.size] }
  end

  private

  attr_reader :entries
end
