# Bank

## How to install

In your terminal, follow these steps:

```
$ git clone git@github.com:stephengeller/bank-tech-test.git
$ cd bank-tech-test
$ bundle install
```

## How to use

Within the repository directory:
```Ruby
$ irb # or you can use Pry, like I have
[1] pry(main)> require_relative 'lib/statement'
=> true
[2] pry(main)> require_relative 'lib/account'
=> true
[3] pry(main)> my_account = Account.new
=> #<Account:0x007fba4f141c78 @balance=0, @log=[]>
[4] pry(main)> my_statement = Statement.new
=> #<Statement:0x007fba4f0d9c18>
[6] pry(main)> my_account.deposit 10
=> "Your balance is now 10"
[7] pry(main)> my_account.withdraw 5
=> "Your balance is now 5"
[8] pry(main)> my_statement.print(my_account)
date || credit || debit || balance
02/10/2017 || || 10.00 || 10.00
02/10/2017 || 5.00 || || 5.00
=> nil
```
