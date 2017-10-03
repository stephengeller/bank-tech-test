require_relative './statement'

class UserInterface

  def initialize(statement = Statement.new, account = Account.new)
    @statement = statement
    @account = account
  end

  def deposit(amount)
    @account.deposit amount
    @statement.add_deposit(amount)
    puts "£#{amount} successfully deposited"
  end

  def withdraw(amount)
    raise 'Insufficient funds' if insufficient_funds?(amount)
    @account.withdraw amount
    @statement.add_withdrawal(amount)
    puts "£#{amount} successfully deposited"
  end

  def print_statement
    @statement.print
  end

  def insufficient_funds?(amount)
    amount > @account.balance
  end

end
