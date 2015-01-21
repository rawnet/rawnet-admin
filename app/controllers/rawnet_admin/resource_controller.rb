module RawnetAdmin
  class ResourceController < ApplicationController

    protected

    def collection
      get_collection_ivar || begin
        set_collection_ivar(end_of_association_chain.page(params[:page] || 1).per(params[:per] || 25))
      end
    end
    helper_method :collection

    def resource
      get_resource_ivar || begin
        set_resource_ivar(end_of_association_chain.find(params[:id]))
      end
    end
    helper_method :resource

    def resource_class
      @resource_class ||= controller_name.classify.safe_constantize
    end
    helper_method :resource_class

    private

    def end_of_association_chain
      apply_scopes_if_available(resource_class)
    end

    def get_resource_ivar
      instance_variable_get("@#{resource_instance_name}")
    end

    def set_resource_ivar(resource)
      instance_variable_set("@#{resource_instance_name}", resource)
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

    def apply_scopes_if_available(association)
      respond_to?(:apply_scopes) ? apply_scopes(association) : association
    end

  end
end
