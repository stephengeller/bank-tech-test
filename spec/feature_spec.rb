require_relative '../lib/account'
require_relative '../lib/statement_line'
require_relative '../lib/statement'
require_relative '../lib/log_holder'
require_relative '../lib/user_interface'

describe 'feature' do

  it 'deposits, withdraws and prints a statement' do
    statement = Statement.new
    my_account = Account.new
    ui = UserInterface.new
    my_logs = LogHolder.new
    today = Time.now.strftime('%d/%m/%Y')
    ui.deposit(my_account, 10, my_logs)
    ui.deposit(my_account, 10, my_logs)
    ui.withdraw(my_account, 5, my_logs)
    expect { statement.print(my_logs.logs) }.to output(
    "date || credit || debit || balance\n" +
    "#{today} || || 10.00 || 10.00\n" +
    "#{today} || || 10.00 || 20.00\n" +
    "#{today} || 5.00 || || 15.00\n"
    ).to_stdout
  end
end
