module RawnetAdmin
  module ResourceHelper
    def show_link_to(route, text='Show', options={})
      icon_link_to text, route, 'search', options
    end

    def edit_link_to(route, text='Edit', options={})
      icon_link_to text, route, 'pencil', options
    end

    def delete_link_to(route, text='Delete', options={})
      options = {
          method: :delete,
          data: {
              confirm: "Are you sure?"
          }
      }.merge(options)
      icon_link_to text, route, 'trash', options
    end

    def view_link_to(route, text="View", options={})
      icon_link_to text, route, 'new-window', {:target => "_blank" }.merge(options)
    end

    def icon_link_to(text, route, icon, opts={})
      link_to route, opts do
        "<i class='glyphicon glyphicon-#{icon}'></i> #{text}".html_safe
      end
    end

    def tick
      "<i class='glyphicon glyphicon-ok'></i>".html_safe
    end

    def scope_applied?(name, value=nil)
      if value
        current_scopes.keys.include?(name) && current_scopes[name] == value.to_s
      else
        current_scopes.keys.include? name
      end
    end

    def no_scopes_applied?
      (((controller.scopes_configuration.try(:keys) || []) & current_scopes.keys) - [:page]).empty?
    end
  end
end
