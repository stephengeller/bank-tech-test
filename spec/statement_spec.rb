require 'statement'

describe Statement do
  let(:account) { double :account }
  let(:first_log) { [{ date: '01/01/2001', action: :deposit, amount: '10.00', balance: '10.00' }] }
  let(:second_log) { { date: '02/02/2002', action: :withdraw, amount: '5.00', balance: '5.00' } }

  before do
    both_logs = first_log.push(second_log)
    allow(account).to receive(:log).and_return(both_logs)
    @formatted_first_log = '01/01/2001 || || 10.00 || 10.00'
    @formatted_log_two = '02/02/2002 || 5.00 || || 5.00'
    @both_logs_formatted = "#{@formatted_first_log}\n#{@formatted_log_two}"
    @full_statement = "#{subject.top_row}#{@both_logs_formatted}\n"
  end

  it 'works' do
    expect(subject.class).to eq described_class
  end

  it 'has fixed column labels' do
    expect(subject.top_row).to eq "date || credit || debit || balance\n"
  end

  context '#create' do


    it 'creates the top row' do
      expect(subject.create(account)).to include subject.top_row
    end

    it 'creates one logged transaction' do
      expect(subject.create(account)).to include @formatted_first_log
    end

    it 'creates multiple transactions in order' do
      expect(subject.create(account)).to eq "#{@full_statement}"
    end
  end

  context '#print' do
    it 'returns the statement to standard output' do
    expect { subject.print(account) }.to output("#{@full_statement}").to_stdout
    end
  end
end
