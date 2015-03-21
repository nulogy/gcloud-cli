require 'rest_client'
require 'gcloud/cli/version'
require 'gcloud/cli/config_repository'

module Gcloud
  module Cli
    module_function

    def create_gorgon_cluster
      config = ConfigRepository.find_or_create
      RestClient.post(config.url, api_key: config.api_key)
    end
  end
end
