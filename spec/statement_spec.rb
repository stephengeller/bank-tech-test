require 'statement'

describe Statement do
  it 'works' do
    expect(subject.class).to eq described_class
  end

  it 'has fixed column labels' do
    expect(subject.top_row).to eq 'date || credit || debit || balance'
  end

  context '#date' do
    it 'returns date in nice format'
  end
end
