class Statement
  def top_row
    "date || credit || debit || balance\n"
  end

  def create(bank_account)
    statement_string = top_row
    statement_string += render_logs(bank_account.log)
    statement_string
  end

  def print(bank_account)
    puts create(bank_account)
  end

  private

  def render_logs(logs)
    str = ''
    logs.each do |transaction|
      str += transaction
      str += "\n"
    end
    str
  end
end
