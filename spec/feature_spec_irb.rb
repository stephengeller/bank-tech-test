require_relative '../lib/account'
require_relative '../lib/statement_line'
require_relative '../lib/statement'
require_relative '../lib/log_holder'
require_relative '../lib/user_interface'

statement = Statement.new
my_account = Account.new
ui = UserInterface.new
my_logs = LogHolder.new
ui.deposit(my_account, 10, my_logs)
ui.deposit(my_account, 10, my_logs)
ui.withdraw(my_account, 10, my_logs)
statement.print(my_logs)
