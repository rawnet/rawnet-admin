module RawnetAdmin
  module Resource
    module Actions
      def index(options={}, &block)
        respond_with(collection, options, &block)
      end
      alias :index! :index

      def show(options={}, &block)
        respond_with(resource, options, &block)
      end
      alias :show! :show

      def new(options={}, &block)
        respond_with(build_resource, options, &block)
      end
      alias :new! :new

      def edit(options={}, &block)
        respond_with(resource, options, &block)
      end
      alias :edit! :edit

      def create(options={}, &block)
        object = build_resource
        create_resource(object)
        respond_with_dual_blocks(object, options, &block)
      end
      alias :create! :create

      def create(options={}, &block)
        object = build_resource
        create_resource(object)
        respond_with_dual_blocks(object, options, &block)
      end
      alias :create! :create

      def update(options={}, &block)
        object = resource
        update_resource(object, resource_params)
        respond_with_dual_blocks(object, options, &block)
      end
      alias :update! :update

      def destroy(options={}, &block)
        object = resource
        destroy_resource(object)
        respond_with_dual_blocks(object, options, &block)
      end
      alias :destroy! :destroy

      # Make aliases protected
      protected :index!, :show!, :new!, :create!, :edit!, :update!, :destroy!
    end
  end
end
