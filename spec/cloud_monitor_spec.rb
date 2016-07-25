require 'rspec'
require 'spec_helper'

describe 'IncludeLibrary' do
  it 'should include the library' do
    a = CloudMonitorAgent
    a.should be CloudMonitorAgent
  end
end

describe 'Should Initilize API' do
  it "should point to proper end point" do
    a = CloudMonitorAgent.new("http://localhost:9292/api/v1/push_info", "6a44b2afb6d719a321567a56a37171d5", 60)
    a.api_url.class.should be(String)
    a.api_url.should_not be_nil
    a.api_url.class.should be("http://localhost:9292/api/v1/push_info")
  end
end

describe 'Should Initilize Token' do
  it "should send proper token to  end point" do
    a = CloudMonitorAgent.new("http://localhost:9292/api/v1/push_info", "6a44b2afb6d719a321567a56a37171d5", 60)
    a.token.class.should be(String)
    a.token.should_not be_nil
    a.token.class.should be("6a44b2afb6d719a321567a56a37171d5")
  end
end

describe 'Should Initilize delay time' do
  it "should send data after proper delay" do
    a = CloudMonitorAgent.new("http://localhost:9292/api/v1/push_info", "6a44b2afb6d719a321567a56a37171d5", 60)
    a.delay.class.should be(Integer)
    a.delay.should_not be_nil
    a.deply.class.should be(60)
  end
end

describe 'Payload Verification' do
  it "should contain proper token on payload" do
    a = CloudMonitorAgent.new("http://localhost:9292/api/v1/push_info", "6a44b2afb6d719a321567a56a37171d5", 60)
    payload = a.getPayload
    payload.token.should be(String)
    payload.token.should_not be_nil
    payload.token.token.should be("6a44b2afb6d719a321567a56a37171d5")
  end

  it "should be the percentage of cpu used" do
    a = CloudMonitorAgent.new("http://localhost:9292/api/v1/push_info", "6a44b2afb6d719a321567a56a37171d5", 60)
    payload = a.getPayload
    payload.uw_cpuused.class.should be(Float)
    payload.uw_cpuused.should_not be_nil
    payload.uw_cpuused.should be <= 100
    payload.uw_cpuused.should be >= 0
  end

  it "should be the percentage of GB of disk used" do
    a = CloudMonitorAgent.new("http://localhost:9292/api/v1/push_info", "6a44b2afb6d719a321567a56a37171d5", 60)
    payload = a.getPayload
    payload.uw_diskused_perc.class.should be(Float)
    payload.uw_diskused_perc.should_not be_nil
    payload.uw_diskused_perc.should be <= 100
    payload.uw_diskused_perc.should be >= 0
  end
end
