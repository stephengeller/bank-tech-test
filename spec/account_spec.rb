require 'account'

describe Account do
  let(:log_holder) { double :log_holder }
  subject { Account.new(0, log_holder) }

  before do
    first_log = "Log 1"
    allow(log_holder).to receive(:add_log).and_return(first_log)
  end

  it 'works' do
    expect(subject.class).to eq(described_class)
  end

  context '#deposit' do
    it 'can deposit money into the account' do
      subject.deposit 10
      expect(subject.balance).to eq 10
    end

    it 'can deposit any amount' do
      subject.deposit 45
      expect(subject.balance).to eq 45
    end

    it 'can add to existing balance' do
      subject.deposit 10
      expect(subject.balance).to eq 10
      subject.deposit 5
      expect(subject.balance).to eq 15
    end
  end

  context '#withdraw' do
    before do
      subject.deposit 50
    end

    it 'withdraws amount' do
      subject.withdraw 10
      expect(subject.balance).to eq 40
    end

    it 'can withdraw multiple times' do
      subject.withdraw 10
      expect(subject.balance).to eq 40
      subject.withdraw 5
      expect(subject.balance).to eq 35
    end

    it 'can withdraw all funds' do
      subject.withdraw 50
      expect(subject.balance).to eq 0
    end
  end

  context '#logs' do
    context 'with funds' do
      before do
        first_log = "Log 1"
        allow(log_holder).to receive(:add_log).and_return(first_log)
      end

      it 'adds a deposit to it' do
        expect(log_holder).to receive(:add_log).with(:deposit, 10, 10)
        subject.deposit 10
      end

      it 'adds a withdraw to it' do
        expect(log_holder).to receive(:add_log).with(:deposit, 10, 10)
        subject.deposit 10
        expect(log_holder).to receive(:add_log).with(:deposit, 20, 30)
        subject.deposit 20
        expect(log_holder).to receive(:add_log).with(:withdraw, 10, 20)
        subject.withdraw 10
      end
    end
  end
end
