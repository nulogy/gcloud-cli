require "gcloud/cli/version"

require "rest_client"

module Gcloud
  module Cli
    def self.create_gorgon_cluster
      url = 'http://localhost:3000/clusters'

      # MY_NOTE: get API Key from a file
      api_key = 'bcba4ac2fc35257d75adc6c1140dac019c0c34e0f423f78c0a50'

      result = RestClient.post(url, api_key: api_key)

      puts "############ result ##########"
      p result
    end
  end
end
