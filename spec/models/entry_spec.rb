require 'spec_helper'

describe Entry do

 
  let(:user) { FactoryGirl.create(:user) }
  before { @entry = user.entries.build(content: "Lorem ipsum",title: "Lorem ipsum") }

  subject { @entry }

  it { should respond_to(:content) }
  it { should respond_to(:title) }
  it { should respond_to(:user_id) }
  it { should respond_to(:user) }
  its(:user) { should eq user }

  it { should be_valid }

  describe "when user_id is not present" do
    before { @entry.user_id = nil }
    it { should_not be_valid }
  end
  describe "with blank title do" do
    before { @entry.title = "" }
    it { should_not be_valid }
  end
  #describe "with blank content" do
  #  before { @entry.content = "" }
  #  it { should_not be_valid }
  #end
  #describe "with content that is too long" do  
  #	before {@entry.content = "a" * 141 }
  #	it {should_not be_valid}
  #end
  describe "with title that is too long" do  
  	before {@entry.title = "a" * 141 }
  	it {should_not be_valid}
  end
 end
