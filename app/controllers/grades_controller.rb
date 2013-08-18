class GradesController < ApplicationController

 def show
    #@grade = Grade.find(params[:id])

    # if params[:exam_id]
    #   @grade = current_user.grades.where(:exam_id => params[:exam_id])
    # else
    #   @grades = current_user.grades.includes(:exam).group_by(&:exam_id)
    # end
    #@subscription = Subscription.find_by_id(params[:subscription_id])
    #@grade = @survey.grades.where(:survey_id => params[:exam_id])
    #@grade = @survey.grades.find_by_id(:survey_id => params[:exam_id])

    @survey = Survey.find_by_id(params[:survey_id])
    @grade = @survey.grades.where(:survey_id => params[:survey_id])
    @response_answers = params[:questions]    

  end

  def new
    @survey = Survey.find_by_id(params[:survey_id])
    @questions = @survey.questions.includes(:answers)
    #@grade = @survey.build_grade
    @grade = @survey.grades.new

  end

  def create
    @survey = Survey.find_by_id(params[:survey_id])
    @questions = @survey.questions.includes(:answers)
    #@grade = @survey.build_grade
    @grade = @survey.grades.new
    @correct_answers = @survey.answers.select('answers.id, answers.correct').where(:correct => true).pluck('answers.id').to_a

    @response_answers = params[:questions]
    @response_answers.save

    @grade.average_grade = @grade.calculate_grade(@correct_answers, @response_answers)
    @grade.survey_id = @survey.id
        
    if @grade.save
      redirect_to survey_grade_path(@survey, @grade), :notice => t("ui.grades.take_exam.success")
    else
      render :new
    end

  end
end
