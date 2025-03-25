alias UnderstandingGenServer.FibonacciServer

caller = self()
IO.inspect(self(), label: "SELF")

pid = FibonacciServer.start()
send pid, {caller, {:compute, 10}}
send pid, {caller, {:compute, 20}}
send pid, {caller, {:compute, 30}}
send pid, {caller, {:status}}
