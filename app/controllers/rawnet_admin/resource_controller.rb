module RawnetAdmin
  class ResourceController < RawnetAdmin::ApplicationController
    responders :flash, :http_cache, :collection
    respond_to :html, :xml, :json

    include RawnetAdmin::Resource::Helpers
    include RawnetAdmin::Resource::Actions

    helper_method :paginated_collection, :collection, :resource, :resource_class
  end
end
