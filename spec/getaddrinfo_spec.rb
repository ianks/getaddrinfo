require 'spec_helper'

describe Gethostname do
  it 'has a version number' do
    expect(Gethostname::VERSION).not_to be nil
  end

  it 'returns nil with a bunk address' do
    expect(Gethostname.gethostname('not a real host')).to be_empty
  end

  it 'gets the IP address' do
    expect(Gethostname.gethostname('google.com')).to_not be_empty
    expect(Gethostname.gethostname('apple.com')).to_not be_empty
    expect(Gethostname.gethostname('kernel.org')).to_not be_empty
    expect(Gethostname.gethostname('kernel.org')).to_not be_empty
    expect(Gethostname.gethostname('ruby-lang.org')).to_not be_empty
  end
end
