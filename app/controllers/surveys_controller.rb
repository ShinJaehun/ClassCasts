class SurveysController < ApplicationController
  # devise
  before_filter :authenticate_user!, :except => [:show, :index]
  # cancan 각 액션에 대한 권한 설정
  load_and_authorize_resource
  # 응시, 결과 처리, 결과와 관련된 액션은 cancan 적용 제외
  skip_authorize_resource :only => [:answering, :grading, :results]
  
  # GET /surveys
  # GET /surveys.json
  def index
    # survey 생성
    @surveys = Survey.all
  
    # 화면 오른쪽에 공지사항, FAQ, QNA, 수업영상을 표시
    @notice5 = Post.notice.just5
    @faq5 = Post.faq.just5
    @qna5 = Post.qna.just5
    @casts5 = Cast.just5


    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @surveys }
    end
  end

  def answering
    # 응시
    @survey = Survey.find(params[:id])
 
   end

  def grading
    # 채점 : 미완성
    @survey = Survey.find(params[:id])
    # 사용자별 점수 저장 : 미완성
    @survey.user_id = current_user.id

    # 사용자가 선택한 checkbox 리스트 저장
    @checked = params[:a_checkbox]

    # results 액션으로 렌더링
    render 'results', :object => @survey

 end

  def results
            
  end

  # GET /surveys/1
  # GET /surveys/1.json
  def show
    @survey = Survey.find(params[:id])
  
    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @survey }
    end
  end

  # GET /surveys/new
  # GET /surveys/new.json
  def new
    @survey = Survey.new

    # railscasts 196, 197
    # 3.times do
    #   question =  @survey.questions.build
    #   4.times { question.answers.build }
    # end
  
  end

  # GET /surveys/1/edit
  def edit
    @survey = Survey.find(params[:id])
  end

  # POST /surveys
  # POST /surveys.json
  def create
    @survey = Survey.new(params[:survey])
    
    respond_to do |format|
      if @survey.save
        format.html { redirect_to @survey, :notice => 'Survey was successfully created.' }
        format.json { render :json => @survey, :status => :created, :location => @survey }
      else
        format.html { render :action => "new" }
        format.json { render :json => @survey.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /surveys/1
  # PUT /surveys/1.json
  def update
    @survey = Survey.find(params[:id])

    respond_to do |format|
      if @survey.update_attributes(params[:survey])
        format.html { redirect_to @survey, :notice => 'Survey was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @survey.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /surveys/1
  # DELETE /surveys/1.json
  def destroy
    @survey = Survey.find(params[:id])
    @survey.destroy

    respond_to do |format|
      format.html { redirect_to surveys_url }
      format.json { head :no_content }
    end
  end


end
