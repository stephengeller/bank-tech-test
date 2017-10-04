require_relative '../lib/account'
require_relative '../lib/statement_line'
require_relative '../lib/statement'
require_relative '../lib/log_holder'
require_relative '../lib/user_interface'

describe 'feature' do

  it 'deposits, withdraws and prints a statement' do

    ## TODO - INITIALIZE account within UI, have a class (dependency inject) of LogHolder within Account, so LogHolder calls the actions on it but still within account
    my_account = Account.new
    ui = UserInterface.new(my_account)
    today = Time.now.strftime('%d/%m/%Y')
    ui.deposit(10)
    ui.deposit(10)
    ui.withdraw(5)
    expect { ui.print_statement }.to output(
    "date || credit || debit || balance\n" +
    "#{today} || || 10.00 || 10.00\n" +
    "#{today} || || 10.00 || 20.00\n" +
    "#{today} || 5.00 || || 15.00\n"
    ).to_stdout
  end
end
