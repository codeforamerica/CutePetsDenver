class Greeting
  FILE = "lib/greetings.json"

  def greetings
      JSON.parse(IO.read(FILE))
  end

  def random
      greetings.sample
  end
end