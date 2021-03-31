# frozen_string_literal: true

# Error pronable behaviour which allows object to add errors
# and response to valid?
module ErrorPronable
  attr_reader :errors

  def valid?
    errors.size.zero?
  end
end
