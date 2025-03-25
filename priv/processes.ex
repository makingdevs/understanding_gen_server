alias UnderstandingGenServer.FibonacciServer
alias UnderstandingGenServer.GenericServer

caller = self()
IO.inspect(self(), label: "SELF")

pid = FibonacciServer.start()

GenericServer.cast(pid, {:compute, 10})
GenericServer.cast(pid, {:compute, 20})
GenericServer.cast(pid, {:compute, 30})
