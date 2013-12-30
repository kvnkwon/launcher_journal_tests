require 'spec_helper'

describe Entry do
  it { should belong_to(:user) }
  it { should belong_to(:category) }

  let(:blanks){[nil,'']}
  it { should have_valid(:title).when('Class Methods', 'rspec', 'TDD') }
  it { should_not have_valid(:title).when(*blanks) }
  it { should have_valid(:description).when('Better way to write Ruby', 'How to test with rspec', 'The only way to program')}
  it { should_not have_valid(:description).when(*blanks) }

  it { should validate_presence_of(:user) }

  it "persists valid entry" do
    count = Entry.count
    entry = FactoryGirl.build(:entry)
    entry.title = 'title'
    entry.description = 'desc'
    entry.save
    expect(entry.created_at).to_not be
    expect(Entry.count).to eql(count)
    entry.user = FactoryGirl.create(:user)
    entry.save
    expect(Entry.count).to_not eql(count)
    expect(entry.created_at).to be_present
  end
end
