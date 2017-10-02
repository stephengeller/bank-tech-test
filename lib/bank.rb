class Bank
  STARTING_BALANCE = 0

  attr_reader :balance, :log

  def initialize(balance = STARTING_BALANCE)
    @balance = balance
    @log = []
  end

  def deposit(amount)
    @balance += amount
    add_to_log(:deposit, amount)
    successful_deposit(amount)
    return_balance
  end

  def withdraw(amount)
    raise 'Insufficient funds' if insufficient_funds?(amount)
    @balance -= amount
    add_to_log(:withdraw, amount)
    successful_withdraw(amount)
    return_balance
  end

  private

  def successful_deposit(amount)
    "You have successfully deposited #{amount}"
  end

  def successful_withdraw(amount)
    "You have successfully withdrawn #{amount}"
  end

  def return_balance
    "Your balance is now #{@balance}"
  end

  def insufficient_funds?(amount)
    amount > @balance
  end

  def add_to_log(action, amount)
    date = Time.now.strftime('%d/%m/%Y')
    action = action
    amount = amount.round(2).to_s
    balance = @balance.round(2).to_s
    @log.push(
      date: date,
      action: action,
      amount: amount,
      balance: balance)
  end
end
