require 'statement'

describe Statement do
  let(:account) { double :account }
  let(:first_log) { ['01/01/2001 || || 10.00 || 10.00'] }
  let(:second_log) { first_log.push('02/02/2002 || 5.00 || || 5.00') }

  before do
    allow(account).to receive(:logs).and_return(second_log)
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

  context '#print' do
    it 'returns the statement to standard output' do
      expect { subject.print(account) }.to output("#{@full_statement}").to_stdout
    end
  end
end
