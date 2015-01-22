module RawnetAdmin
  class ApplicationController < ::ApplicationController
    before_filter :authorize_rawnet_admin_user

    protected

    def site_name
      RawnetAdmin.config.site_name
    end
    helper_method :site_name

    def rawnet_admin_user
      send(RawnetAdmin.config.user_method)
    end
    helper_method :rawnet_admin_user

    private

    def authorize_rawnet_admin_user
      if RawnetAdmin.config.authenticate_method
        send(RawnetAdmin.config.authenticate_method)
      end
    end
  end
end
