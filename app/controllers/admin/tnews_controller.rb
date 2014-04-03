class Admin::TnewsController < ApplicationController
  # GET /admin/tnews
  # GET /admin/tnews.json
  def index
    @admin_tnews = Admin::Tnews.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @admin_tnews }
    end
  end

  # GET /admin/tnews/1
  # GET /admin/tnews/1.json
  def show
    @admin_tnews = Admin::Tnews.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @admin_tnews }
    end
  end

  # GET /admin/tnews/new
  # GET /admin/tnews/new.json
  def new
    @admin_tnews = Admin::Tnews.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @admin_tnews }
    end
  end

  # GET /admin/tnews/1/edit
  def edit
    @admin_tnews = Admin::Tnews.find(params[:id])
  end

  # POST /admin/tnews
  # POST /admin/tnews.json
  def create
    @admin_tnews = Admin::Tnews.new(params[:admin_tnews])

    respond_to do |format|
      if @admin_tnews.save
        format.html { redirect_to @admin_tnews, notice: 'Tnews was successfully created.' }
        format.json { render json: @admin_tnews, status: :created, location: @admin_tnews }
      else
        format.html { render action: "new" }
        format.json { render json: @admin_tnews.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /admin/tnews/1
  # PUT /admin/tnews/1.json
  def update
    @admin_tnews = Admin::Tnews.find(params[:id])

    respond_to do |format|
      if @admin_tnews.update_attributes(params[:admin_tnews])
        format.html { redirect_to @admin_tnews, notice: 'Tnews was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @admin_tnews.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/tnews/1
  # DELETE /admin/tnews/1.json
  def destroy
    @admin_tnews = Admin::Tnews.find(params[:id])
    @admin_tnews.destroy

    respond_to do |format|
      format.html { redirect_to admin_tnews_index_url }
      format.json { head :no_content }
    end
  end
end
