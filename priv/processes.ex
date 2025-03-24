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

Process.alive?(pid1)
Process.alive?(pid2)
Process.alive?(pid3)

send pid1, {caller, 10}
send pid2, {caller, 15}
send pid3, {caller, 20}


send pid1, :noop
send pid2, :noop
send pid3, :noop
