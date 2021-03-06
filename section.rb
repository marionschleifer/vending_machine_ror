require_relative 'article'
require_relative 'statistic_log'
require 'date'

class Section

  attr_reader :article

  def initialize
    @article = nil
    @sold_at = nil
  end

  def add_article(article)
    @article = article
  end

  def remove_article #if article present
    StatisticLog.instance.add_sold_article(@article, @sold_at)
    @article = nil
  end

  def empty?
    !@article
  end

end