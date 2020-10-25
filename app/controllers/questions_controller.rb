class QuestionsController < ApplicationController
	before_action :authenticate_user!
  before_action :set_question, only: [:show,:edit,:update,:destroy]

  def new
		if current_user.admin
  		@question = Question.new
		else
			redirect_to root_path
		end
  end

  def show
      @answers = Answer.where(question_id: @question.id)
      @answer= Answer.new
      respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    if current_user.admin
  	@question = Question.new(questions_params)
    	if @question.save
    		redirect_to root_path
    	else
    		render 'new'
    	end
    end
  end

  def destroy
  	@question.destroy
  	redirect_to root_path
  end

  def edit
  end

  def update
  	@question.update(questions_params)
  	redirect_to root_path
  end


  def right
    @question = Question.find(params[:question_id])
    @flag = false
    @all = params[:user_answer]
    Answer.where(id: @all).each do |ans|
      if ans.ans_ques
        @flag=true
        break
      end
    end
    pp @flag
    respond_to do |format|
      format.js
    end

  end

  private
  	def questions_params
  		params.require(:question).permit(:name)

  	end

  	def set_question
  		@question = Question.find(params[:id])
  	end
end
