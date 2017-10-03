require_relative './statement_line'

class Account
  STARTING_BALANCE = 0

  attr_reader :balance

  def initialize(balance = STARTING_BALANCE, log = StatementLine.new)
    @balance = balance
    @log = log
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
    log = @log.create(action, amount, @balance)
    @logs.push(log)
  end
end
