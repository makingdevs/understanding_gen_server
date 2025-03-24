defmodule UnderstandingGenServer.FibonacciServer do
  alias UnderstandingGenServer.Fibonacci

  def start() do
    spawn(__MODULE__, :loop, [])
  end

  def loop do
    receive do
      n -> Fibonacci.sequence(n)
    end
  end
end
