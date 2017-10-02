require 'bank'

describe Bank do
  it 'works' do
    expect(subject.class).to eq(described_class)
  end

  context '#deposit' do
    it 'can deposit money into the bank' do
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
    context 'when sufficient funds' do
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

    context 'when insufficient funds' do
      it 'cannot withdraw more than funds' do
        subject.deposit 50
        expect { subject.withdraw 51 } .to raise_error('Insufficient funds')
      end
    end

    context '#log' do
      context 'at start' do
        it 'starts empty' do
          expect(subject.log).to eq []
        end
      end

      context 'with funds' do
        before do
          @date = Time.now.strftime('%d/%m/%Y')
          subject.deposit 100
        end

        it 'adds a deposit to it with date' do
          subject.deposit 10
          expect(subject.log.last[:date]).to eq(@date)
        end

        it 'adds a withdraw to it with date' do
          subject.withdraw 10
          expect(subject.log.last[:date]).to eq(@date)
        end
      end

      context 'withdrawing without funds' do
        it 'does not add withdraw' do
          expect(subject.balance).to eq 0
          expect(subject.log).to eq []
          expect { subject.withdraw 10 } .to raise_error('Insufficient funds')
          expect(subject.log).to eq []
        end
      end
    end
  end
end
