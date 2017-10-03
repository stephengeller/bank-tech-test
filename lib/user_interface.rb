require 'log_holder'

class UserInterface

  def initialize(log_holder = LogHolder.new)
    @log_holder = log_holder
  end

  def deposit(account, amount)
    account.deposit amount
    @log_holder.add_log(:deposit, amount, account.balance)
  end

  def withdraw(account, amount)
    raise 'Insufficient funds' if insufficient_funds?(account, amount)
    account.withdraw amount
    @log_holder.add_log(:withdrawal, amount, account.balance)
  end

  def insufficient_funds?(account, amount)
    amount > account.balance
  end

end
