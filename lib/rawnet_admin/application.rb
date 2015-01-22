require "rawnet_admin/configuration"

module RawnetAdmin
  class Application
    def config
      @config ||= Configuration.new
    end
  end
end
