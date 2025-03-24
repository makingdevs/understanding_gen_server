alias UnderstandingGenServer.FibonacciServer

caller = self()
IO.inspect(self(), label: "SELF")

pid = FibonacciServer.start()
send pid, {caller, 10}
send pid, {caller, 20}
send pid, {caller, 30}
send pid, {caller, :status}
