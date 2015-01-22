require "bootstrap-sass"
require "has_scope"
require "responders"
require "active_link_to"
require "kaminari"
require "bootstrap-kaminari-views"
require "rawnet_admin/application"
require 'rawnet_admin/resource/helpers'
require 'rawnet_admin/resource/actions'
require "rawnet_admin/engine"

module RawnetAdmin

  class << self
    attr_accessor :application

    def application
      @application ||= RawnetAdmin::Application.new
    end
  end

  def self.configure
    yield(application.config)
  end

  def self.config
    application.config
  end

  def self.mount(router, &block)
    if block_given?
      RawnetAdmin::Engine.routes.draw do
        instance_eval(&block)
      end
    end
    router.mount RawnetAdmin::Engine => "/admin"
  end

end
