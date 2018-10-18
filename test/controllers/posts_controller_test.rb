require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @post = posts(:post_one)
    login_as :login_one
  end

  test 'should get index' do
    get posts_url
    assert_response :success
    assert_not_nil assigns(:posts)
  end

  test 'should get archive' do
    get archive_url
    assert_response :success
    assert_not_nil assigns(:posts)
  end

  test 'should get new' do
    get new_post_url
    assert_response :success
  end

  test 'should create post' do
    assert_difference('Post.count') do
      post posts_url, params: {
        post: {
          contents: @post.contents,
          title: @post.title,
          slug: 'new-slug'
        }
      }
    end

    assert_redirected_to post_path(assigns(:post))
  end

  test 'should show post' do
    get post_url(@post)
    assert_response :success
  end

  test 'should get edit' do
    get edit_post_url(@post)
    assert_response :success
  end

  test 'should update post' do
    patch post_url(@post), params: {
      post: {
        contents: @post.contents,
        title: @post.title,
        slug: @post.slug
      }
    }
    assert_redirected_to post_path(assigns(:post))
  end

  test 'should destroy post' do
    assert_difference('Post.count', -1) do
      delete post_url(@post)
    end

    assert_redirected_to posts_path
  end
end
