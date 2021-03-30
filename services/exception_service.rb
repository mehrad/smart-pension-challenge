# frozen_string_literal: true

# Excpetion service currently only warn and exit
class ExceptionService
  def self.throw_exception(msg, exit: true)
    warn msg
    exit 1 if exit
  end
end
