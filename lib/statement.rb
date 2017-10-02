class Statement


  def top_row
    'date || credit || debit || balance'
  end

  def print(bank_account)
    statement_string = ""
    statement_string += top_row
    statement_string += render_logs(bank_account.log)
    return statement_string
  end

  private

  def render_logs(logs)
    string = ""
    logs.each do |transaction|
      date = transaction[:date]
      action = transaction[:action]
      amount = transaction[:amount]
      balance = transaction[:balance]
      if action == :deposit
        string += "#{date} || || #{amount} || #{balance} "
      else
        string += "#{date} || #{amount} || || #{balance}"
      end
      # if transaction[:action] == :withdraw
      #   string += render_withdraw(transaction)
      # else
      #   string += render_deposit(transaction)
      # end
    end
    p string
    return string
  end

  # loop over logs
  # if deposit, call deposit print method and add to string
  # else withdraw method
  # return string
end
