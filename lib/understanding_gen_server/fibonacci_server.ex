defmodule UnderstandingGenServer.FibonacciServer do
  alias UnderstandingGenServer.Fibonacci

  def loop do
    receive do
      n -> Fibonacci.sequence(n)
    end
  end
end
