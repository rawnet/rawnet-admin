module RawnetAdmin
  class ApplicationController < ::ApplicationController
    before_filter :authorize_rawnet_admin

    protected

    def site_name
      RawnetAdmin.config.site_name
    end
    helper_method :site_name

    private

    def authorize_rawnet_admin
      if RawnetAdmin.config.authenticate_method
        send(RawnetAdmin.config.authenticate_method)
      end
    end
  end
end
