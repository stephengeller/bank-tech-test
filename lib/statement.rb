class Statement
  TOP_ROW = "date || credit || debit || balance\n"

  def print(bank_account)
    puts create(bank_account)
  end

  private

  def create(bank_account)
    TOP_ROW + render_logs(bank_account.logs)
  end

  def render_logs(logs)
    logs.join("\n")
  end
end
