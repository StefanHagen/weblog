module ApplicationHelper

  # Special class for syntax highlighting
  class HTMLwithPygments < Redcarpet::Render::HTML
    def block_code(code, language)
      sha = Digest::SHA1.hexdigest(code)
      Rails.cache.fetch ["code", language, sha].join('-') do
        Pygments.highlight(code, lexer: language)
      end
    end
  end

  # Generate the html for the menu button
  def front_menu_item(key, path, current)
    content_tag(:li, :class => current) do 
      link_to(path, :class => key, :data => { :no_turbolink => true }) do
        content_tag(:div, nil, :class => "orb") + raw(t("navigation.#{key}"))
      end
    end
  end

  # Render the input variable as Markdown
  def markdown(text)
    renderer = HTMLwithPygments.new(hard_wrap: true, filter_html: true)
    options = [ autolink: true, tables: true, disable_indented_code_blocks: true, fenced_code_blocks: true, strikethrough: true, highlight: true, quote: true, footnotes: true, prettify: true, ]
    Redcarpet::Markdown.new(renderer, *options).render(text).html_safe
  end

end
