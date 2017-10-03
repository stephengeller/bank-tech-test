require 'statement_line'

describe StatementLine do

  def current_date
    return Time.now.strftime('%d/%m/%Y')
  end

  let(:first_log) { { date: current_date, action: :deposit, amount: '10.00', balance: '10.00' } }

  it 'works' do
    expect(subject.class).to eq described_class
  end

  context '#create' do
    it 'returns a string of a deposit, formatted' do
      log_string = "#{current_date} || || 10.00 || 10.00"
      expect(subject.create(:deposit, 10, 10)).to eq log_string
    end

    it 'returns a string of a withdrawal, formatted' do
      log_string = "#{current_date} || 10.00 || || 10.00"
      expect(subject.create(:withdrawal, 10, 10)).to eq log_string
    end
  end
end
