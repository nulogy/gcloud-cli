require_relative '../lib/gcloud/cli'

module Gcloud::Cli
  RSpec.describe Gcloud::Cli do
    let(:url) { 'a-url' }
    let(:api_key) { 'a-key' }

    it "loads config and post request" do
      allow(ConfigRepository).to receive(:load).and_return(Config.new(url, api_key))

      expect(RestClient).to receive(:post).with(url, api_key: api_key)

      Gcloud::Cli.create_gorgon_cluster
    end
  end
end