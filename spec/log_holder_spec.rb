require 'log_holder'

describe LogHolder do
  let(:statement_line) { double :statement_line }
  subject { LogHolder.new(statement_line) }

  it 'works' do
    expect(subject).to be
  end

  it 'stores a log' do
    expect(statement_line).to receive(:create).and_return('log')
    subject.add_log(:deposit, 10, 10)
    expect(subject.logs).to eq(['log'])
  end

end
