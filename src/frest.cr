# TODO: Write documentation for `Frest`

require "kemal"

module Frest
  VERSION = "0.1.0"

  get "/" do
    "Hello World from Crystal"
  end

  Kemal.run
  # TODO: Put your code here
end
