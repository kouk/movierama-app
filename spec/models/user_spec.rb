require 'rails_helper'
require 'spec_helper'

RSpec.describe User, type: :model do

  before(:each) { @user = FactoryGirl.build(:user) }

  subject { @user }

  it { should respond_to(:email) }

  it "#email returns a string" do
    expect(@user.email).to match 'person[0-9]+@example.com'
  end
end
