require 'spec_helper'

describe User do
  
  it { should have_many(:entries) }

  let(:blanks){[nil,'']}
  it { should have_valid(:first_name).when('Kevin', 'John', 'Mo') }
  it { should_not have_valid(:first_name).when(*blanks) }
  it { should have_valid(:last_name).when('Kwon', 'Smith', 'Zhu') }
  it { should_not have_valid(:last_name).when(*blanks) }

end
