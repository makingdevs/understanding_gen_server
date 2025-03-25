alias UnderstandingGenServer.FibonacciServer

caller = self()
IO.inspect(self(), label: "SELF")

pid = FibonacciServer.start()
send pid, {{:compute, 10}, caller}
send pid, {{:compute, 20}, caller}
send pid, {{:compute, 30}, caller}
send pid, {{:status, :status}, caller} # ERROR
