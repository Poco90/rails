require "test_helper"

class ArticleTest < ActiveSupport::TestCase
  test "Should Save an Article" do
    article = Article.new
    assert article.save
  end

  test "Find Article" do
    article = Article.new
    article.title = "Articles Test"
    article.body = "Articles Body Test"
    article.published = false
    article.save

    expected_article = Article.find(article.id)
    assert_equal expected_article.title, article.title
    assert_equal expected_article.published, article.published
  end

  test "Destroy Article Test" do
    article = Article.new
    article.title = "Destroyed Article Title"
    article.body = "Destroyed Article Body"
    article.published = true
    article.save

    assert article.destroy
    assert_raises(ActiveRecord::RecordNotFound) { Article.find(article.id) }
  end
  test "Should Update Articles" do  
    one_article = articles(:one)
    one_article.update({
      title:"Read Paper"
    })
    assert_equal(one_article.title, "Read Paper")
end
end
