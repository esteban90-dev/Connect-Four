require "./lib/console.rb"

describe Console do
  context "#initialize" do
    it "Does not raise an exception when initialized with an empty {}" do
      expect{ Console.new }.not_to raise_error(KeyError)
    end

    it "By default has input set to $stdin" do
      console = Console.new
      expect(console.input).to eql($stdin)
    end

    it "By default has output set to $stdout" do
      console = Console.new
      expect(console.output).to eql($stdout)
    end

    it "Input can be initialized with a StringIO object" do
      console = Console.new( {:input => StringIO.new } )
      expect(console.input).to be_a(StringIO)
    end

    it "Output can be initialized with a StringIO object" do
      console = Console.new( {:output => StringIO.new } )
      expect(console.output).to be_a(StringIO)
    end
  end

  context "#write" do
    it "Writes a string to output" do
      console = Console.new( {:output => StringIO.new} )
      message = "Hello\n"
      console.write(message)
      expect(console.output.string).to eql(message)
    end
  end


end