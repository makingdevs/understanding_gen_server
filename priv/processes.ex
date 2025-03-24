alias UnderstandingGenServer.FibonacciServer

caller = self()
IO.inspect(self(), label: "SELF")

pid1 = FibonacciServer.start()
send pid1, {caller, 10}
pid2 = FibonacciServer.start()
send pid2, {caller, 15}
pid3 = FibonacciServer.start()
send pid3, {caller, 20}

IO.inspect [pid1, pid2, pid3]
