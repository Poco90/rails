require "test_helper"

class ArticlesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @article = articles(:one)
  end

  test "should get another page" do
    get "/another_page"
    assert_response :success
  end

  test "should count number of articles" do
    article_count = Article.count
    get articles_url
    assert_equal article_count, controller.instance_variable_get('@articles').size
    puts "Number of articles in the database: #{article_count}"
  end  

  require 'benchmark'

  test "site should respond within a reasonable time" do
    time = Benchmark.realtime do
      get articles_url
    end
  
    assert_operator time, :<, 0.0, "Response time #{time.round(2)}s was not within a reasonable limit"
  end
  
  
  

  test "should get index" do
    get articles_url
    assert_response :success
  end

  test "should get new" do
    get new_article_url
    assert_response :success
  end

  test "should create article" do
    assert_difference("Article.count") do
      post articles_url, params: { article: { body: @article.body, published: @article.published, title: @article.title } }
    end

    assert_redirected_to article_url(Article.last)
  end

  test "should show article" do
    get article_url(@article)
    assert_response :success
  end

  test "should get edit" do
    get edit_article_url(@article)
    assert_response :success
  end

  test "should update article" do
    patch article_url(@article), params: { article: { body: @article.body, published: @article.published, title: @article.title } }
    assert_redirected_to article_url(@article)
  end

  test "should destroy article" do
    assert_difference("Article.count", -1) do
      delete article_url(@article)
    end

    assert_redirected_to articles_url
  end
end
