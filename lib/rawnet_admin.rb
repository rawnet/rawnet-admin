require "bootstrap-sass"
require "has_scope"
require "active_link_to"
require "kaminari"
require "bootstrap-kaminari-views"
require "rawnet_admin/engine"

module RawnetAdmin

  def self.mount(router, &block)
    if block_given?
      RawnetAdmin::Engine.routes.draw do
        instance_eval(&block)
      end
    end
    router.mount RawnetAdmin::Engine => "/admin"
  end

end
