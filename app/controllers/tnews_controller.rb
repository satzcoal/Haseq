class TnewsController < ApplicationController
  # GET /admin/tnews
  # GET /admin/tnews.json
  def index
    @tnews = Tnews.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tnews }
    end
  end

  # GET /admin/tnews/1
  # GET /admin/tnews/1.json
  def show
    @tnews = Tnews.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @tnews }
    end
  end

  # GET /admin/tnews/new
  # GET /admin/tnews/new.json
  def new
    @tnews = Tnews.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @tnews }
    end
  end

  # GET /admin/tnews/1/edit
  def edit
    @tnews = Tnews.find(params[:id])
  end

  # POST /admin/tnews
  # POST /admin/tnews.json
  def create
    @tnews = Tnews.new(params[:tnews])

    respond_to do |format|
      if @tnews.save
        format.html { redirect_to @tnews, notice: 'Tnews was successfully created.' }
        format.json { render json: @tnews, status: :created, location: @tnews }
      else
        format.html { render action: "new" }
        format.json { render json: @tnews.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /admin/tnews/1
  # PUT /admin/tnews/1.json
  def update
    @tnews = Tnews.find(params[:id])

    respond_to do |format|
      if @tnews.update_attributes(params[:tnews])
        format.html { redirect_to @tnews, notice: 'Tnews was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @tnews.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/tnews/1
  # DELETE /admin/tnews/1.json
  def destroy
    @tnews = Tnews.find(params[:id])
    @tnews.destroy

    respond_to do |format|
      format.html { redirect_to tnews_index_url }
      format.json { head :no_content }
    end
  end
end
