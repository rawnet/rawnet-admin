require 'rawnet_admin/black_hole'

module RawnetAdmin
  module Resource
    module Helpers

      protected

      def collection
        get_collection_ivar || begin
          set_collection_ivar(end_of_association_chain.page(params[:page] || 1).per(params[:per] || 25))
        end
      end

      def resource
        get_resource_ivar || begin
          set_resource_ivar(end_of_association_chain.find(params[:id]))
        end
      end

      def build_resource
        get_resource_ivar || set_resource_ivar(end_of_association_chain.new(resource_params))
      end

      def create_resource(object)
        object.save
      end

      def update_resource(object, attributes)
        object.update(attributes)
      end

      def destroy_resource(object)
        object.destroy
      end

      def resource_class
        @resource_class ||= controller_name.classify.safe_constantize
      end

      private

      def end_of_association_chain
        apply_scopes_if_available(resource_class)
      end

      def get_resource_ivar
        instance_variable_get("@#{resource_instance_name}")
      end

      def set_resource_ivar(object)
        instance_variable_set("@#{resource_instance_name}", object)
      end

      def get_collection_ivar
        instance_variable_get("@#{resource_collection_name}")
      end

      def set_collection_ivar(collection)
        instance_variable_set("@#{resource_collection_name}", collection)
      end

      def resource_collection_name
        controller_name.to_sym
      end

      def resource_instance_name
        controller_name.singularize.to_sym
      end

      def resource_params
        parameters = permitted_params || params
        parameters[resource_instance_name] || {}
      end

      def permitted_params
        return nil unless respond_to?("#{resource_instance_name}_params", true)
        {resource_instance_name => send("#{resource_instance_name}_params")}
      rescue ActionController::ParameterMissing
        # typically :new action
        if params[:action].to_s == 'new'
          {resource_instance_name => {}}
        else
          raise
        end
      end

      def respond_with_dual_blocks(object, options, &block)
        args = ([object] << options)
        case block.try(:arity)
        when 2
          respond_with(*args) do |responder|
            black_hole = RawnetAdmin::BlackHole.new
            if object.errors.empty?
              block.call(responder, black_hole)
            else
              block.call(black_hole, responder)
            end
          end
        when 1
          respond_with(*args, &block)
        else
          options[:location] = block.call if block
          respond_with(*args)
        end
      end

      def apply_scopes_if_available(association)
        respond_to?(:apply_scopes, true) ? apply_scopes(association) : association
      end

    end
  end
end
