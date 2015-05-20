require 'rest_client'
require 'gcloud/cli/version'
require 'gcloud/cli/config_repository'
require 'json'

module Gcloud
  module Cli
    extend self

    def create_gorgon_cluster(grid_configuration_name)
      config = ConfigRepository.find_or_create
      result = JSON[post_create_cluster(config, grid_configuration_name)]

      { cluster_id: result['cluster_id'] }
    end

    def release_gorgon_cluster(cluster_id)
      config = ConfigRepository.find_or_create
      RestClient.post(config.release_cluster_url(cluster_id), api_key: config.api_key)
    end

    private

    def post_create_cluster(config, grid_configuration_name)
      RestClient.post(config.create_cluster_url,
        api_key: config.api_key,
        grid_configuration_name: grid_configuration_name
      )
    end
  end
end
