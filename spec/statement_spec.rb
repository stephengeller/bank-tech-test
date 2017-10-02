require 'statement'

describe Statement do
  let(:bank) { double :bank }
  let(:log_one) { [{ date: '01/01/2001', action: :deposit, amount: '10.00', balance: '10.00' }] }
  let(:second_log) { [{ date: '02/02/2002', action: :withdraw, amount: 5.00, balance: 5.00 }] }


  it 'works' do
    expect(subject.class).to eq described_class
  end

  it 'has fixed column labels' do
    expect(subject.top_row).to eq 'date || credit || debit || balance'
  end

  context '#print' do

    before do
      allow(bank).to receive(:log).and_return(log_one)
      @formatted_log_one = "01/01/2001 || || 10.00 || 10.00"
    end

    it 'prints the top row' do
      expect(subject.print(bank)).to include subject.top_row
    end

    it 'prints one logged transaction' do
      p bank.log
      expect(subject.print(bank)).to include @formatted_log_one
    end
  end
end
