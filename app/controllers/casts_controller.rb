class CastsController < ApplicationController
  # devise
  before_filter :authenticate_user!, :except => [:show, :index]
  # cancan 각 액션에 대한 권한 설정
  load_and_authorize_resource
  
  # GET /casts
  # GET /casts.json
  def index
    # navbar에서 cast all과 cast 5학년, cast 6학년을 따로 정렬
    @casts = Cast.recent.search(params[:search], params[:page])
    @casts_5th = Cast.five.recent.search(params[:search], params[:page])
    @casts_6th = Cast.six.recent.search(params[:search], params[:page])

    # 화면 오른쪽에 공지사항, FAQ, QNA, 수업영상을 표시
    @notice5 = Post.notice.just5
    @faq5 = Post.faq.just5
    @qna5 = Post.qna.just5
    @casts5 = Cast.just5

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @casts }
    end
  end

  # GET /casts/1
  # GET /casts/1.json
  def show
    @cast = Cast.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @cast }
    end
  end

  # GET /casts/new
  # GET /casts/new.json
  def new
    @cast = Cast.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @cast }
    end
  end

  # GET /casts/1/edit
  def edit
    @cast = Cast.find(params[:id])
  end

  # POST /casts
  # POST /casts.json
  def create
    @cast = Cast.new(params[:cast])

    respond_to do |format|
      if @cast.save
        format.html { redirect_to @cast, :notice => 'Cast was successfully created.' }
        format.json { render :json => @cast, :status => :created, :location => @cast }
      else
        format.html { render :action => "new" }
        format.json { render :json => @cast.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /casts/1
  # PUT /casts/1.json
  def update
    @cast = Cast.find(params[:id])

    respond_to do |format|
      if @cast.update_attributes(params[:cast])
        format.html { redirect_to @cast, :notice => 'Cast was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @cast.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /casts/1
  # DELETE /casts/1.json
  def destroy
    @cast = Cast.find(params[:id])
    @cast.destroy

    respond_to do |format|
      format.html { redirect_to casts_url }
      format.json { head :no_content }
    end
  end
  
end
