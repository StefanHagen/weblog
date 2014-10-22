module AdminHelper

  # Generate the html for the menu button
  def menu_item(key, path, current)
    content_tag(:li, :class => current) do 
      link_to(path, :class => key, :data => { :no_turbolink => true }) do
        raw(t("admin.navigation.#{key}"))
      end
    end
  end

  # Generate the html for a sub menu button
  def sub_menu_item(key, path, current, icon)
    content_tag(:li, :class => current) do
      link_to(path, :class => key, :data => { :no_turbolink => true }) do
        content_tag(:span, "", :class => "glyphicon glyphicon-#{icon}") + raw(t("admin.sub_navigation.#{key}"))
      end
    end
  end

  # Return "active" class when menu item is active
  def menu_active?(*args)
    if args.include?(controller_name.to_sym)
      "active"
    else
      nil
    end
  end
end
