require 'redcarpet/render_strip'

module ApplicationHelper

  class CodeRayify < Redcarpet::Render::HTML
    def block_code(code, language)
      CodeRay.scan(code, language).div
    end
  end

  def markdown(text)
    coderayified = CodeRayify.new(:filter_html => true, :hard_wrap => true)

    options = {
      :fenced_code_blocks => true,
      :no_intra_emphasis => true,
      :autolink => true,
      :lax_html_blocks => true,
    }

    markdowner = Redcarpet::Markdown.new(coderayified, options)

    return markdowner.render(text).html_safe
  end

  def strip_markdown(text)
    stripdown = Redcarpet::Markdown.new(Redcarpet::Render::StripDown, :space_after_headers => true)
    return stripdown.render(text)
  end

end
