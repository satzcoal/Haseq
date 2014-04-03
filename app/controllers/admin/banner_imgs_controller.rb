class Admin::BannerImgsController < ApplicationController
  # GET /banner_imgs
  # GET /banner_imgs.json
  def index
    @banner_imgs = Admin::BannerImg.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @banner_imgs }
    end
  end

  # GET /banner_imgs/1
  # GET /banner_imgs/1.json
  def show
    @banner_img = Admin::BannerImg.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @banner_img }
    end
  end

  # GET /banner_imgs/new
  # GET /banner_imgs/new.json
  def new
    @banner_img = Admin::BannerImg.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @banner_img }
    end
  end

  # GET /banner_imgs/1/edit
  def edit
    @banner_img = Admin::BannerImg.find(params[:id])
  end

  # POST /banner_imgs
  # POST /banner_imgs.json
  def create
    uploaded_io = params[:admin_banner_img][:filetmp]
    if uploaded_io != nil
      @filepath = rand(0xffffff).to_s + uploaded_io.original_filename
      File.open(Rails.root.join('public', 'uploads', 'banner', @filepath), 'wb') do |file|
        file.write(uploaded_io.read)
      end
      params[:admin_banner_img].delete('filetmp')
      params[:admin_banner_img][:path] = '/uploads/banner/' + @filepath
    end

    @banner_img = Admin::BannerImg.new(params[:banner_img])

    respond_to do |format|
      if @banner_img.save
        format.html { redirect_to @banner_img, notice: 'Banner img was successfully created.' }
        format.json { render json: @banner_img, status: :created, location: @banner_img }
      else
        format.html { render action: "new" }
        format.json { render json: @banner_img.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /banner_imgs/1
  # PUT /banner_imgs/1.json
  def update
    uploaded_io = params[:admin_banner_img][:filetmp]
    if uploaded_io != nil
      @filepath = rand(0xffffff).to_s + uploaded_io.original_filename
      File.open(Rails.root.join('public', 'uploads', 'banner', @filepath), 'wb') do |file|
        file.write(uploaded_io.read)
      end
      params[:admin_banner_img].delete('filetmp')
      params[:admin_banner_img][:path] = '/uploads/banner/' + @filepath
    end

    @banner_img = Admin::BannerImg.find(params[:id])

    respond_to do |format|
      if @banner_img.update_attributes(params[:admin_banner_img])
        format.html { redirect_to @banner_img, notice: 'Banner img was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @banner_img.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /banner_imgs/1
  # DELETE /banner_imgs/1.json
  def destroy
    @banner_img = Admin::BannerImg.find(params[:id])
    @banner_img.destroy

    respond_to do |format|
      format.html { redirect_to admin_banner_imgs_url }
      format.json { head :no_content }
    end
  end
end
