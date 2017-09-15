module ApplicationHelper

  def markdown(text)
    markdowner = Redcarpet::Markdown.new(Redcarpet::Render::HTML,
      no_intra_emphasis: true,
      fenced_code_blocks: true,
      disable_indented_code_blocks: true)

    return markdowner.render(text).html_safe
  end

end
