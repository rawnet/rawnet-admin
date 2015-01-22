module RawnetAdmin
  module Resource
    module Actions
      def index(options={}, &block)
        respond_with(collection, options, &block)
      end
      alias :index! :index
    end
  end
end
