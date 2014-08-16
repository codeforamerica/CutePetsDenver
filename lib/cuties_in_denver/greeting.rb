require 'json'

# Gives you a random greeting from a file
class Greeting
  FILE = 'lib/greetings.json'

  def greetings
    JSON.parse(IO.read(FILE))
  end

  def random
    greetings.sample
  end
end
