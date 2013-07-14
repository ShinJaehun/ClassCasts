class CastsController < ApplicationController
  # GET /casts
  # GET /casts.json
  def index
    @casts = Cast.all(:order => "created_at DESC")
    @casts_5th = Cast.five.recent
    @casts_6th = Cast.six.recent

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
