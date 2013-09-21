require_relative '../../spec_helper'

describe TrueVault::Client do  
  it "must include httparty methods" do
  	TrueVault::Client.must_include HTTParty
  end

  it "must have the base url set to the TrueVault endpoint" do
  	TrueVault::Client.base_uri.must_equal 'https://api.truevault.com'
	end


	describe "GET list of vaults" do
		let(:client){ TrueVault::Client.new('anything')}

		before do
			VCR.insert_cassette 'list_vaults'
		end

		after do
			VCR.eject_cassette
		end

		it "records the fixture" do
			tv = TrueVault::Client.new(ENV["TV_API_KEY"], ENV["TV_ACCOUNT_ID"], 'v1')
			tv.list_vaults
		end

		it "must respond to list_vaults" do 
			client.must_respond_to :list_vaults
		end

	end

end

