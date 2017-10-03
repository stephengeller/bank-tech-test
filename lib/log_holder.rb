class LogHolder

  attr_reader :logs

  def initialize
    @logs = []
  end

  def add_log(log)
    @logs.push(log)
  end

end
