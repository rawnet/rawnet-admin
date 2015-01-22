module RawnetAdmin
  class ResourceController < ApplicationController
    include RawnetAdmin::Resource::Helpers
    include RawnetAdmin::Resource::Actions

    helper_method :collection, :resource, :resource_class
  end
end
