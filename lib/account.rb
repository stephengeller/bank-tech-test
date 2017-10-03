require_relative './statement_line'

class Account
  STARTING_BALANCE = 0

  attr_reader :balance, :logs

  def initialize(balance = STARTING_BALANCE, log = StatementLine.new)
    @balance = balance
    @statement_line = log
    @logs = []
  end

  def deposit(amount)
    @balance += amount
    add_to_log(:deposit, amount)
  end

  def withdraw(amount)
    @balance -= amount
    add_to_log(:withdraw, amount)
  end

  private

  def add_to_log(action, amount)
    @logs.push(@statement_line.create(action, amount, @balance))
  end
end
