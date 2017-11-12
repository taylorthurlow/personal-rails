require 'test_helper'

class PostTest < ActiveSupport::TestCase
  test 'should get updated date line' do
    post = Post.create!(
      title: 'some title',
      slug: 'some-slug',
      tag_line: 'some tag line',
      contents: 'lorem ipsum blah blah blah'
    )

    assert !post.date_line.include?('updated')
    post.update_attributes!(contents: 'some different contents here')
    assert post.date_line.include? 'updated'
  end
end
