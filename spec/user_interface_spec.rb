require 'user_interface'

describe UserInterface do
  let(:account) { double :account }
  subject { UserInterface.new(account) }

  before do
    allow(account).to receive(:deposit)
    allow(account).to receive(:withdraw)
    allow(account).to receive(:balance).and_return 100
  end

  describe '#deposit' do
    it 'deposits into an account and confirms message' do
      success_message = "£10 successfully deposited\n"
      expect { subject.deposit(10) }.to output(success_message).to_stdout
    end
  end

  describe '#withdraw' do
    before do
      subject.deposit(20)
      allow(account).to receive(:balance).and_return 10
    end

    describe 'with funds' do
      it 'withdraws from an account and confirms message' do
        subject.withdraw(10)
      end
    end

    describe 'without funds' do
      it 'returns error' do
        expect { subject.withdraw(30) } .to raise_error("Insufficient funds")
      end
    end
  end

end
