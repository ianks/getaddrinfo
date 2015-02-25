require 'benchmark/ips'
require 'gethostbyname'
require 'socket'

Benchmark.ips do |x|
  x.report 'Gethostbyname.gethostbyname =>' do
    Gethostbyname.gethostbyname 'apple.com'
  end

  x.report 'Socket.gethostbyname =>' do
    Socket.gethostbyname 'apple.com'
  end
end
