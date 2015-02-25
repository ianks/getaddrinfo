require 'benchmark/ips'
require 'gethostname'
require 'socket'

Benchmark.ips do |x|
  x.report 'gethostname' do
    Gethostname.gethostname 'apple.com'
  end

  x.report 'gethostbyname' do
    Socket.gethostbyname 'apple.com'
  end
end
