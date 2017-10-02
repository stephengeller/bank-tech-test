class Statement


  def top_row
    "date || credit || debit || balance\n"
  end

  def print(bank_account)
    statement_string = top_row
    statement_string += render_logs(bank_account.log)
    puts statement_string
    return statement_string
  end

  private

  def render_logs(logs)
    str = ""
    logs.each do |transaction|
      if transaction[:action] == :deposit
        str += "#{transaction[:date]} || || #{transaction[:amount]} || #{transaction[:balance]}"
      else
        str += "#{transaction[:date]} || #{transaction[:amount]} || || #{transaction[:balance]}"
      end
      str += "\n" unless transaction == logs.last
    end
    return str
  end
end
