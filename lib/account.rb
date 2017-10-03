require_relative './log'

class Account
  STARTING_BALANCE = 0

  attr_reader :balance, :logs

  def initialize(balance = STARTING_BALANCE, log = Log.new)
    @balance = balance
    @log = log
    @logs = []
  end

  def deposit(amount)
    @balance += amount
    add_to_log(:deposit, amount)
    return_balance
  end

  def withdraw(amount)
    raise 'Insufficient funds' if insufficient_funds?(amount)
    @balance -= amount
    add_to_log(:withdraw, amount)
    return_balance
  end

  private

  def return_balance
    "Your balance is now #{@balance}"
  end

  def insufficient_funds?(amount)
    amount > @balance
  end

  def add_to_log(action, amount)
    log = @log.create(action, amount, @balance)
    @logs.push(log)
  end
end
