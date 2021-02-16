=begin
#Accounting Extension

#These APIs allow you to interact with HubSpot's Accounting Extension. It allows you to: * Specify the URLs that HubSpot will use when making webhook requests to your external accounting system. * Respond to webhook calls made to your external accounting system by HubSpot 

The version of the OpenAPI document: v3

Generated by: https://openapi-generator.tech
OpenAPI Generator version: 4.3.1

=end

require 'spec_helper'
require 'json'
require 'date'

# Unit tests for Hubspot::Crm::Extensions::Accounting::ResultIdAccountingResponse
# Automatically generated by openapi-generator (https://openapi-generator.tech)
# Please update as you see appropriate
describe 'ResultIdAccountingResponse' do
  before do
    # run before each test
    @instance = Hubspot::Crm::Extensions::Accounting::ResultIdAccountingResponse.new
  end

  after do
    # run after each test
  end

  describe 'test an instance of ResultIdAccountingResponse' do
    it 'should create an instance of ResultIdAccountingResponse' do
      expect(@instance).to be_instance_of(Hubspot::Crm::Extensions::Accounting::ResultIdAccountingResponse)
    end
  end
  describe 'test attribute "result"' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
      # validator = Petstore::EnumTest::EnumAttributeValidator.new('String', ["OK", "ERR"])
      # validator.allowable_values.each do |value|
      #   expect { @instance.result = value }.not_to raise_error
      # end
    end
  end

  describe 'test attribute "id"' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

end