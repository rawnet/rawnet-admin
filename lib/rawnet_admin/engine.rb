module RawnetAdmin
  class Engine < ::Rails::Engine
    isolate_namespace RawnetAdmin

    config.generators do |g|
      g.test_framework :rspec, :fixture => false
      g.assets false
      g.helper false
    end
  end
end
