class StatementLine

  def create(action, amount, balance)
    if action == :deposit
      format_deposit(action, amount, balance)
    else
      format_withdrawal(action, amount, balance)
    end
  end

  private

  def format_deposit(_action, amount, balance)
    "#{current_date} || || #{format_two_decimal(amount)} || #{format_two_decimal(balance)}"
  end

  def format_withdrawal(_action, amount, balance)
    "#{current_date} || #{format_two_decimal(amount)} || || #{format_two_decimal(balance)}"
  end

  def format_two_decimal(number)
    format('%.2f', number)
  end

  def current_date
    return Time.now.strftime('%d/%m/%Y')
  end

end
