module RawnetAdmin
  class Configuration
    @@defaults = {
      site_name: 'Rawnet Admin',
      user_method: :current_user,
      authenticate_method: :authenticate_admin!,
      parent_controller: '::ApplicationController',
      javascripts: [],
      stylesheets: []
    }

    cattr_accessor :config

    def initialize
      self.config ||= ConfigHash[@@defaults]
    end

    def method_missing(name, *args, &block)
      self.config.send(name, *args, &block)
    end
  end

  class ConfigHash < Hash
    def method_missing(name, *args, &block)
      if name.to_s.ends_with? '='
        send :[]=, name.to_s.chomp('=').to_sym, *args
      else
        #send(:[], name.to_sym, &block)
        send(:[], name.to_sym)
      end
    end
  end
end
