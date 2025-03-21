defmodule UnderstandingGenServer.Fibonacci do
  def sequence(0), do: 1
  def sequence(1), do: 1
  def sequence(n), do: sequence(n - 1) + sequence(n - 2)
end
