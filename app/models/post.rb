class Post < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged

  # validation
  validates :title, :contents, :slug, presence: true
  validates :slug, uniqueness: true
  validates_format_of :slug, with: /\A[a-z0-9]+\z/i

  def generate_markdown_html
    renderer = Redcarpet::Render::HTML.new(render_options = {prettify: true})
    markdown = Redcarpet::Markdown.new(renderer, fenced_code_blocks: true)
    return markdown.render(self.contents)
  end

  def date_line
    line = 'posted ' + self.created_at.localtime.strftime('%b %e %Y @ %l:%M %p')
    if self.created_at != self.updated_at
      line += ', updated ' + self.updated_at.localtime.strftime('%b %e %Y @ %l:%M %p')
    end
    return line
  end
end
