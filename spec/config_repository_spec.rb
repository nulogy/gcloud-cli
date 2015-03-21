require_relative '../lib/gcloud/cli'

module Gcloud::Cli
  RSpec.describe ConfigRepository do
    let(:url) { 'a-url' }
    let(:api_key) { 'a-key' }

    it "saves and post request" do
      allow(ConfigRepository).to receive(:ask).and_return(url, api_key)
      allow(ConfigRepository).to receive(:puts)
      allow(ConfigRepository).to receive(:load).and_return(nil)

      expect(ConfigRepository).to receive(:save) do |config|
        expect(config.url).to eq(url)
        expect(config.api_key).to eq(api_key)
      end

      ConfigRepository.find_or_create
    end
  end
end