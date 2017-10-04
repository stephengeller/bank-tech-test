require_relative './log_holder'

class Account
  STARTING_BALANCE = 0

  attr_reader :balance, :log_holder

  def initialize(balance = STARTING_BALANCE, log_holder = LogHolder.new)
    @balance = balance
    @log_holder = log_holder
  end

  def deposit(amount)
    @balance += amount
  end

  def withdraw(amount)
    @balance -= amount
    add_to_log(:withdraw, amount)
  end

  private

  def add_to_log(action, amount)
    @log_holder.add_log(action, amount, @balance)
  end
end
