require "#{File.join(File.dirname(__FILE__),'..','spec_helper.rb')}"
describe "icinga::user" do
  # create user, without password

  let(:node) { 'icinga' }
  let(:facts) { {:operatingsystem => 'Debian', :kernel => 'Linux'} }
  let(:pre_condition) {
    "class { 'icinga': server => true, }"
  }

  let(:title) { 'dummyuser1' }
  let(:params) {
    {
      :ensure => 'present'
    }
  }

  it do
    should create_icinga__user('dummyuser1')
  end
end

describe "icinga::user" do
  # create user, with password

  let(:node) { 'icinga' }
  let(:facts) { {:operatingsystem => 'Debian', :kernel => 'Linux'} }
  let(:pre_condition) {
    "class { 'icinga': server => true, }"
  }

  let(:title) { 'dummyuser2' }
  let(:params) {
    {
      :ensure   => 'present',
      :password => 'default'
    }
  }

  it do
    should create_icinga__user('dummyuser2')
  end
end
