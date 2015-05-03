require 'rest_client'
require 'gcloud/cli/version'
require 'gcloud/cli/config_repository'

module Gcloud
  module Cli
    module_function

    def create_gorgon_cluster
      config = ConfigRepository.find_or_create
      RestClient.post(config.create_cluster_url, api_key: config.api_key)
    end

    def release_gorgon_cluster(cluster_id)
      config = ConfigRepository.find_or_create
      RestClient.post(config.release_cluster_url(cluster_id), api_key: config.api_key)
    end
  end
end
