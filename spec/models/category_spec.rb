require 'spec_helper'

describe Category do
  it { should have_many(:entries) }

  let(:blanks){[nil,'']}
  it { should have_valid(:name).when('Ruby', 'Testing', 'Awesomeness')}
  it { should_not have_valid(:name).when(*blanks) }

  it { should validate_uniqueness_of(:name) }

end
