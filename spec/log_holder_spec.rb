require 'log_holder'

describe LogHolder do

  it 'works' do
    expect(subject).to be
  end

  it 'stores a log' do
    subject.add_log 'log'
    expect(subject.logs).to eq ['log']
  end


end
