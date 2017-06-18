class Post < ActiveRecord::Base
  # validation
  validates :title, presence: true
  validates :contents, presence: true

  def date_line
    line = 'posted ' + self.created_at.localtime.strftime('%b %e %Y, %l:%M %p')
    if self.created_at != self.updated_at
      line += ', updated ' + self.updated_at.localtime.strftime('%b %e %Y, %l:%M %p')
    end
    return line
  end
end
