class PagesController < ApplicationController
	before_action :authenticate_user!, only:[:test]
  def index
  end

  def test
  	@question = Question.all
  	@i=1
  	@res=0
  end
end
