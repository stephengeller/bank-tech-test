require_relative '../lib/account'
require_relative '../lib/statement_line'
require_relative '../lib/statement'
require_relative '../lib/user_interface'


describe 'feature' do
  it 'prints full statement after depositing and withdrawing' do
    my_account = Account.new
    ui = UserInterface.new(Statement.new, my_account)
    ui.deposit 10
    ui.withdraw 5
    expect { ui.print_statement }.to output(
    "date || credit || debit || balance\n" +
    "01/01/2001 || || 10.00 || 10.00\n" +
    "02/02/2002 || 5.00 || || 5.00\n"
    ).to_stdout
  end
end
