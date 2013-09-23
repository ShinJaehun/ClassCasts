class PostsController < ApplicationController
  # devise
  before_filter :authenticate_user!, :except => [:show, :index]
  # category를 생성하는 prepare_categories 메서드 호출
  before_filter :prepare_categories
  # cancan 각 액션에 대한 권한 설정
  load_and_authorize_resource


  # GET /posts
  # GET /posts.json
  def index
    # post 생성, 내림차순으로 정렬
    @posts = Post.recent.search(params[:search], params[:page])

    # 화면 오른쪽에 공지사항, FAQ, QNA, 수업영상을 표시
    @notice5 = Post.notice.just5
    @faq5 = Post.faq.just5
    @qna5 = Post.qna.just5
    @casts5 = Cast.just5


    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @posts }
    end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @post = Post.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @post }
    end
  end

  # GET /posts/new
  # GET /posts/new.json
  def new
    @post = Post.new
    @categories = Category.all

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @post }
    end
  end

  # GET /posts/1/edit
  def edit
    @post = Post.find(params[:id])
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(params[:post])
    # post를 생성한 사용자 id 저장
    @post.user_id = current_user.id

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, :notice => 'Post was successfully created.' }
        format.json { render :json => @post, :status => :created, :location => @post }
      else
        format.html { render :action => "new" }
        format.json { render :json => @post.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /posts/1
  # PUT /posts/1.json
  def update
    @post = Post.find(params[:id])

    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to @post, :notice => 'Post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @post.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :no_content }
    end
  end

  private

  def prepare_categories
    # category 생성에 필요한 메서드
    @categories = Category.all
  end
end
