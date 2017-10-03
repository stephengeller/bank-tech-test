require_relative './statement_line'

class LogHolder

  attr_reader :logs

  def initialize(statement_line = StatementLine.new)
    @logs = []
    @statement_line = statement_line
  end

  def add_log(action, amount, balance)
    @logs.push(@statement_line.create(action, amount, balance))
  end

end
