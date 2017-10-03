class UserInterface

  def deposit(account, amount)
    account.deposit amount
    puts "£#{amount} successfully deposited"
  end

  def withdraw(account, amount)
    raise 'Insufficient funds' if insufficient_funds?(account, amount)
    account.withdraw amount
    puts "£#{amount} successfully deposited"
  end

  def insufficient_funds?(account, amount)
    amount > account.balance
  end

end
