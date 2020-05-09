class Console
  attr_reader :input, :output

  def initialize(input={})
    @input = input.fetch(:input, $stdin)
    @output = input.fetch(:output, $stdout)
  end
end