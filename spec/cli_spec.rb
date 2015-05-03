require_relative '../lib/gcloud/cli'

module Gcloud::Cli
  RSpec.describe Gcloud::Cli do
    let(:url) { 'a-url' }
    let(:api_key) { 'a-key' }

    it "loads config and posts request" do
      allow(ConfigRepository).to receive(:load).and_return(Config.new(url, api_key))

      expect(RestClient).to receive(:post).with("#{url}/clusters", api_key: api_key)

      Gcloud::Cli.create_gorgon_cluster
    end

    it "posts relases cluster request" do
      allow(ConfigRepository).to receive(:load).and_return(Config.new(url, api_key))

      expect(RestClient).to receive(:post).with("#{url}/clusters/cluster_1/release", api_key: api_key)

      Gcloud::Cli.release_gorgon_cluster("cluster_1")
    end
  end
end