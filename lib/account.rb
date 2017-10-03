require_relative './statement_line'

class Account
  STARTING_BALANCE = 0

  attr_reader :balance, :logs

  def initialize(balance = STARTING_BALANCE, log = StatementLine.new)
    @balance = balance
  end

  def deposit(amount)
    @balance += amount
  end

  def withdraw(amount)
    @balance -= amount
  end
end
