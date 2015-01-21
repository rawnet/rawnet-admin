require "bootstrap-sass"
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
