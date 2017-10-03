require_relative '../lib/account'
require_relative '../lib/statement_line'
require_relative '../lib/statement'

statement = Statement.new
my_account = Account.new
ui = UserInterface.new
my_account.deposit 10
my_account.withdraw 5
statement.print(my_account)
