class Statement
  TOP_ROW = "date || credit || debit || balance\n"

  def print(logs)
    puts create(logs)
  end

  private

  def create(logs)
    TOP_ROW + render_logs(logs)
  end

  def render_logs(logs)
    logs.join("\n")
  end
end
