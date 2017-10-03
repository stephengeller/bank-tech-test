require 'user_interface'

describe UserInterface do
  let(:account) { double :account }
  let(:log_holder) { double :log_holder }
  subject { UserInterface.new(log_holder)}


  before do
    allow(account).to receive(:deposit)
    allow(account).to receive(:withdraw)
    allow(account).to receive(:balance).and_return 100
  end

  describe '#deposit' do

    before do
      allow(account).to receive(:balance).and_return 10
      allow(log_holder).to receive(:add_log)
    end

    it 'adds log to log_holder' do
      expect(log_holder).to receive(:add_log)
      subject.deposit(account, 10)
    end
  end

  describe '#withdraw' do
    before do
      allow(log_holder).to receive(:add_log)
      subject.deposit(account, 20)
      allow(account).to receive(:balance).and_return 10
    end

    describe 'with funds' do
      it 'adds log to log_holder' do
        expect(log_holder).to receive(:add_log)
        subject.withdraw(account, 10)
      end
    end

    describe 'without funds' do
      it 'returns error' do
        allow(log_holder).to receive(:add_log)
        expect { subject.withdraw(account, 30) } .to raise_error("Insufficient funds")
      end
    end
  end

end
