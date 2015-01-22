module RawnetAdmin
  module ResourceHelper
    def show_link_to(route, text='Show')
      link_to route do
        "<i class='glyphicon glyphicon-search'></i> #{text}".html_safe
      end
    end

    def edit_link_to(route, text='Edit')
      link_to route do
        "<i class='glyphicon glyphicon-pencil'></i> #{text}".html_safe
      end
    end

    def delete_link_to(route, confirm="Are you sure?")
      link_to route, :method => :delete, data: {:confirm => confirm} do
        "<i class='glyphicon glyphicon-trash'></i> Delete".html_safe
      end
    end

    def view_link_to(route, text="View")
      link_to route, :target => "_blank" do
        "<i class='glyphicon glyphicon-new-window'></i> #{text}".html_safe
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
      ((controller.scopes_configuration.keys & current_scopes.keys) - [:page]).empty?
    end
  end
end
