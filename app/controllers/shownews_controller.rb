class ShownewsController < ApplicationController
  def newslist
    @news = Tnews.order('3 DESC')
  end
end
