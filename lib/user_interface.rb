require_relative 'log_holder'

class UserInterface

  def deposit(account, amount, log_holder)
    account.deposit amount
    log_holder.add_log(:deposit, amount, account.balance)
  end

  def withdraw(account, amount, log_holder)
    raise 'Insufficient funds' if insufficient_funds?(account, amount)
    account.withdraw amount
    log_holder.add_log(:withdrawal, amount, account.balance)
  end

  def insufficient_funds?(account, amount)
    amount > account.balance
  end

end
