class Post < ApplicationRecord
  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings

  extend FriendlyId
  friendly_id :name, use: :slugged

  # validation
  validates :title, :contents, :slug, presence: true
  validates :slug, uniqueness: true
  validates_format_of :slug, with: /[a-z0-9-]+/i

  scope :tag, ->(name) { joins(:tags).where(tags: { name: name }) }

  def generate_markdown_html
    renderer = Redcarpet::Render::HTML.new(prettify: true)
    markdown = Redcarpet::Markdown.new(renderer, fenced_code_blocks: true)
    return markdown.render(contents)
  end

  def date_line
    line = 'posted ' + created_at.localtime.strftime('%b %e %Y')
    if ((created_at - updated_at).abs / 1.minute) > (1.day / 1.minute)
      line += ', last updated ' + updated_at.localtime.strftime('%b %e %Y')
    end
    return line
  end

  def all_tags=(names)
    self.tags = names.split(',').map do |name|
      Tag.where(name: name.strip).first_or_create!
    end
  end

  def all_tags
    tags.map(&:name).join(', ')
  end

  private

  def updated?
    return (updated_at - created_at) > 1.day
  end
end
