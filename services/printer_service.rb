# frozen_string_literal: true

# Print as app desired
class PrinterService
  def print_visit_count(entries)
    print(sort(entries), visit_count_header, 'visit')
  end

  def print_unique_visit_count(entries)
    print(sort(entries), unique_visit_count_header, 'unique view')
  end

  private

  def pluralize(key, size)
    return key if size == 1

    "#{key}s"
  end

  def print(entries, header, sentence_key)
    puts header
    entries.each do |key, value|
      puts "#{key} #{value} #{pluralize(sentence_key, value)}"
    end
  end

  def sort(entries)
    entries.sort_by { |_k, v| v }.reverse.to_h
  end

  def visit_count_header
    "\nvisit counts:"
  end

  def unique_visit_count_header
    "\nunique views:"
  end
end
