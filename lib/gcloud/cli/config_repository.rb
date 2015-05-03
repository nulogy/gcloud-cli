require 'yaml'
require 'highline/import'
require 'gcloud/cli/config'

module Gcloud::Cli
  module ConfigRepository
    extend self

    # MY_NOTE: change this when we get gcloud url
    DEFAULT_URL = 'http://localhost:3000'
    CONFIG_FILE = ENV['HOME'] + '/.gcloud'

    def find_or_create
      load || prompt
    end

    private

    def prompt
      puts "Could not find a valid config file. Creating one at #{CONFIG_FILE}"

      url = ask "URL for GCloud: " do |q|
        q.default = DEFAULT_URL
      end

      api_key = ask "API Key: " do |q|
        q.validate = /\w+/
      end

      config = Config.new(url, api_key)
      save(config)

      return config
    end

    def load
      return YAML.load_file(CONFIG_FILE)
    rescue Errno::ENOENT => _
      return false
    end

    def save(config)
      File.open(CONFIG_FILE, 'w') do |file|
        file.write(YAML.dump(config))
      end
    end
  end
end