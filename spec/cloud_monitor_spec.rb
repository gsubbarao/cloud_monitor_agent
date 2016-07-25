require 'rspec'
require 'spec_helper'
require './lib/cloud_monitor_agent'

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
    a.api_url.should eq("http://localhost:9292/api/v1/push_info")
  end
end

describe 'Should Initilize Token' do
  it "should send proper token to  end point" do
    a = CloudMonitorAgent.new("http://localhost:9292/api/v1/push_info", "6a44b2afb6d719a321567a56a37171d5", 60)
    a.token.class.should be(String)
    a.token.should_not be_nil
    a.token.should eq("6a44b2afb6d719a321567a56a37171d5")
  end
end

describe 'Should Initilize delay time' do
  it "should send data after proper delay" do
    a = CloudMonitorAgent.new("http://localhost:9292/api/v1/push_info", "6a44b2afb6d719a321567a56a37171d5", 60)
    a.delay.class.should be(Fixnum)
    a.delay.should_not be_nil
    a.delay.should eq(60)
  end
end

describe 'Payload Verification' do
  it "should contain proper token on payload" do
    a = CloudMonitorAgent.new("http://localhost:9292/api/v1/push_info", "6a44b2afb6d719a321567a56a37171d5", 60)
    payload = a.getPayload
    payload[:token].class.should be(String)
    payload[:token].should_not be_nil
    payload[:token].should eq("6a44b2afb6d719a321567a56a37171d5")
  end

  it "should be the percentage of cpu used" do
    a = CloudMonitorAgent.new("http://localhost:9292/api/v1/push_info", "6a44b2afb6d719a321567a56a37171d5", 60)
    payload = a.getPayload
    payload[:cpu_used].class.should be(Float)
    payload[:cpu_used].should_not be_nil
    payload[:cpu_used].should be <= 100
    payload[:cpu_used].should be >= 0
  end

  it "should be the percentage of GB of disk used" do
    a = CloudMonitorAgent.new("http://localhost:9292/api/v1/push_info", "6a44b2afb6d719a321567a56a37171d5", 60)
    payload = a.getPayload
    payload[:disk_used].class.should be(Float)
    payload[:disk_used].should_not be_nil
    payload[:disk_used].should be <= 100
    payload[:disk_used].should be >= 0
  end
end
