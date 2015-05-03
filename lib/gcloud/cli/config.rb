module Gcloud::Cli
  Config = Struct.new(:url, :api_key) do
    def create_cluster_url
      "#{url}/clusters"
    end

    def release_cluster_url(cluster_id)
      "#{url}/clusters/#{cluster_id}/release"
    end
  end
end