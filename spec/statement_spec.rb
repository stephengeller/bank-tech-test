require 'statement'

describe Statement do
  let(:bank) { double :bank }
  let(:first_log) { [{ date: '01/01/2001', action: :deposit, amount: '10.00', balance: '10.00' }] }
  let(:second_log) { { date: '02/02/2002', action: :withdraw, amount: '5.00', balance: '5.00' } }

  it 'works' do
    expect(subject.class).to eq described_class
  end

  it 'has fixed column labels' do
    expect(subject.top_row).to eq "date || credit || debit || balance\n"
  end

  context '#print' do
    before do
      allow(bank).to receive(:log).and_return(first_log)
      @both_logs = first_log.push(second_log)
      @formatted_first_log = '01/01/2001 || || 10.00 || 10.00'
      @formatted_log_two = '02/02/2002 || 5.00 || || 5.00'
      @both_logs_formatted = "#{@formatted_first_log}\n#{@formatted_log_two}"
    end

    it 'prints the top row' do
      allow(bank).to receive(:log).and_return(first_log)
      expect(subject.print(bank)).to include subject.top_row
    end

    it 'prints one logged transaction' do
      expect(subject.print(bank)).to include @formatted_first_log
    end

    it 'prints multiple transactions' do
      allow(bank).to receive(:log).and_return(@both_logs)
      expect(subject.print(bank)).to include @both_logs_formatted
    end
  end
end
