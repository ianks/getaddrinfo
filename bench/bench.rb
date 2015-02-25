require 'benchmark/ips'
require 'gethostbyname'
require 'socket'

Benchmark.ips do |x|
  x.report 'gethostbyname' do
    Gethostbyname.gethostbyname 'apple.com'
  end

  x.report 'gethostbyname' do
    Socket.gethostbyname 'apple.com'
  end
end
