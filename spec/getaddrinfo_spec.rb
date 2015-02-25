require 'spec_helper'

describe Gethostname do
  it 'has a version number' do
    expect(Gethostname::VERSION).not_to be nil
  end

  it 'returns nil with a bunk address' do
    expect(Gethostname.gethostname('a')).to be_empty
  end

  it 'gets the IP address' do
    expect(Gethostname.gethostname('google.com')).to_not be_empty
  end
end
