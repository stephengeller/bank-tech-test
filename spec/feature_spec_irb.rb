require_relative '../lib/account'
require_relative '../lib/log'
require_relative '../lib/statement'


statement = Statement.new
my_account = Account.new


my_account.deposit 10
my_account.withdraw 5

statement.print(my_account)
