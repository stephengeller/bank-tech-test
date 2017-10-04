require 'statement'

describe Statement do
  let(:account) { double :account }
  let(:first_log) { ['01/01/2001 || || 10.00 || 10.00'] }
  let(:second_log) { first_log.push('02/02/2002 || 5.00 || || 5.00') }

  before do
    allow(account).to receive(:logs).and_return(second_log)
  end

  it 'works' do
    expect(subject.class).to eq described_class
  end

  context '#print' do
    it 'returns the statement to standard output' do
      allow(account).to receive(:join).and_return(
      "01/01/2001 || || 10.00 || 10.00\n" +
      "02/02/2002 || 5.00 || || 5.00\n"
      )
      expect { subject.print(account) }.to output(
      "date || credit || debit || balance\n" +
      "01/01/2001 || || 10.00 || 10.00\n" +
      "02/02/2002 || 5.00 || || 5.00\n"
      ).to_stdout
    end
  end
end
