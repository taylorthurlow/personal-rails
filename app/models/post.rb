class Post < ActiveRecord::Base
  # validation
  validates :title, presence: true
  validates :contents, presence: true

  def generate_markdown_html
    renderer = Redcarpet::Render::HTML.new(render_options = {})
    markdown = Redcarpet::Markdown.new(renderer, fenced_code_blocks: true)
    return markdown.render(self.contents)
  end

  def date_line
    line = 'posted ' + self.created_at.localtime.strftime('%b %e %Y, %l:%M %p')
    if self.created_at != self.updated_at
      line += ', updated ' + self.updated_at.localtime.strftime('%b %e %Y, %l:%M %p')
    end
    return line
  end
end
