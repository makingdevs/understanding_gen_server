defmodule UnderstandingGenServer.FibonacciServer do
  alias UnderstandingGenServer.Fibonacci

  def start() do
    spawn(__MODULE__, :loop, [])
  end

  def loop do
    receive do
      {caller, n} when is_pid(caller) -> send(caller, {:ok, Fibonacci.sequence(n)})
    end
  end
end
