defmodule UnderstandingGenServer.Factorial do
  def of(n, acc \\ 1)
  def of(1, acc), do: acc
  def of(n, acc), do: of(n - 1, n * acc)
end
