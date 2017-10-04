require_relative './statement'

class UserInterface

  def initialize(account, statement = Statement.new)
    @account = account
    @statement = statement
  end

  def deposit(amount)
    @account.deposit(amount)
    puts "£#{amount} successfully deposited"
  end

  def print_statement
    @statement.print(@account.log_holder.logs)
  end

  def withdraw(amount)
    raise 'Insufficient funds' if insufficient_funds?(amount)
    @account.withdraw amount
    puts "£#{amount} successfully deposited"
  end

  private

  def insufficient_funds?(amount)
    amount > @account.balance
  end

end
