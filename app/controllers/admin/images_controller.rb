class Admin::ImagesController < ApplicationController
  # GET /images
  # GET /images.json
  def index
    @images = Admin::Image.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @images }
    end
  end

  # GET /images/1
  # GET /images/1.json
  def show
    @image = Admin::Image.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @image }
    end
  end

  # GET /images/new
  # GET /images/new.json
  def new
    @image = Admin::Image.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @image }
    end
  end

  # GET /images/1/edit
  def edit
    @image = Admin::Image.find(params[:id])
  end

  # POST /images
  # POST /images.json
  def create
    uploaded_io = params[:admin_image][:filetmp]
    if uploaded_io != nil
      @filepath = rand(0xffffff).to_s + uploaded_io.original_filename
      File.open(Rails.root.join('public', 'uploads', 'productimg', @filepath), 'wb') do |file|
        file.write(uploaded_io.read)
      end
      params[:admin_image].delete('filetmp')
      params[:admin_image][:path] = '/uploads/productimg/' + @filepath
    end

    @image = Admin::Image.new(params[:admin_image])

    respond_to do |format|
      if @image.save
        format.html { redirect_to @image, notice: 'Image was successfully created.' }
        format.json { render json: @image, status: :created, location: @image }
      else
        format.html { render action: "new" }
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /images/1
  # PUT /images/1.json
  def update
    uploaded_io = params[:admin_image][:filetmp]
    if uploaded_io != nil
      @filepath = rand(0xffffff).to_s + uploaded_io.original_filename
      File.open(Rails.root.join('public', 'uploads', 'productimg', @filepath), 'wb') do |file|
        file.write(uploaded_io.read)
      end
      params[:admin_image].delete('filetmp')
      params[:admin_image][:path] = '/uploads/productimg/' + @filepath
    end

    @image = Admin::Image.find(params[:id])

    respond_to do |format|
      if @image.update_attributes(params[:admin_image])
        format.html { redirect_to @image, notice: 'Image was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /images/1
  # DELETE /images/1.json
  def destroy
    @image = Admin::Image.find(params[:id])
    @image.destroy

    respond_to do |format|
      format.html { redirect_to admin_images_url }
      format.json { head :no_content }
    end
  end

  def upload

  end
end
