require 'stations'

describe Station do
  it 'test what zone a station is' do
    expect(subject.station[:holborn]).to eq(1)
  end
end