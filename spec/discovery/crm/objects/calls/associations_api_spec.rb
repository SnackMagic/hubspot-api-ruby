require 'spec_helper'

describe 'Hubspot::Discovery::Crm::Objects::Calls::AssociationsApi' do
  subject(:api) { Hubspot::Client.new(access_token: 'test').crm.objects.calls.associations_api }
  
  it { is_expected.to respond_to(:archive) }
  it { is_expected.to respond_to(:create) }
  it { is_expected.to respond_to(:get_all) }
end