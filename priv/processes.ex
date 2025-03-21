IO.inspect(self(), label: "SELF")
parent = self()
spawn(fn -> send(parent, {:ok, UnderstandingGenServer.Fibonacci.sequence(42)}) end)

r1 =
receive do
  {:ok, r} -> r
end

spawn(fn -> send(parent, {:ok, UnderstandingGenServer.Fibonacci.sequence(43)}) end)

r2 =
receive do
  {:ok, r} -> r
end

spawn(fn -> send(parent, {:ok, UnderstandingGenServer.Fibonacci.sequence(44)}) end)

r3 =
receive do
  {:ok, r} -> r
end

IO.inspect [r1, r2, r3]
