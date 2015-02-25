require 'spec_helper'

describe Gethostbyname do
  it 'has a version number' do
    expect(Gethostbyname::VERSION).not_to be nil
  end

  it 'returns nil with a bunk address' do
    expect(Gethostbyname.gethostbyname('not a real host')).to be_empty
  end

  it 'gets the IP address' do
    expect(Gethostbyname.gethostbyname('google.com')).to_not be_empty
    expect(Gethostbyname.gethostbyname('apple.com')).to_not be_empty
    expect(Gethostbyname.gethostbyname('kernel.org')).to_not be_empty
    expect(Gethostbyname.gethostbyname('kernel.org')).to_not be_empty
    expect(Gethostbyname.gethostbyname('ruby-lang.org')).to_not be_empty
  end
end
