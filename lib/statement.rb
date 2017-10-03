class Statement
  TOP_ROW = "date || credit || debit || balance\n"

  def initialize(logs = [], statement_line = StatementLine.new)
    @logs = logs
    @statement_line = statement_line
  end

  def add_deposit(amount)
    log = @statement_line.create(:deposit, amount, @balance)
    @logs.push(log)
  end

  def add_withdrawal(amount)
    log = @statement_line.create(:withdrawal, amount, @balance)
    @logs.push(log)
  end

  def print(logs = @logs)
    puts create(logs)
  end

  private

  def create(logs)
    TOP_ROW + render_logs(logs)
  end

  def render_logs(logs)
    logs.join("\n")
  end
end
