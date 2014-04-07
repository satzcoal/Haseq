class BannerImgsController < ApplicationController
  # GET /banner_imgs
  # GET /banner_imgs.json
  def index
    @banner_imgs = BannerImg.order('2')

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @banner_imgs }
    end
  end

  # GET /banner_imgs/1
  # GET /banner_imgs/1.json
  def show
    @banner_img = BannerImg.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @banner_img }
    end
  end

  # GET /banner_imgs/new
  # GET /banner_imgs/new.json
  def new
    @banner_img = BannerImg.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @banner_img }
    end
  end

  # GET /banner_imgs/1/edit
  def edit
    @banner_img = BannerImg.find(params[:id])
  end

  # POST /banner_imgs
  # POST /banner_imgs.json
  def create
    if params[:banner_img] != nil
      uploaded_io = params[:banner_img][:filetmp]
      if uploaded_io != nil
        @filepath = rand(0xffffff).to_s + uploaded_io.original_filename
        File.open(Rails.root.join('public', 'uploads', 'banner', @filepath), 'wb') do |file|
          file.write(uploaded_io.read)
        end
        params[:banner_img].delete('filetmp')
        params[:banner_img][:path] = '/uploads/banner/' + @filepath
      end
    end

    @banner_img = BannerImg.new(params[:banner_img])
    @banner_img.nindex = BannerImg.order('nindex').last().nindex + 1

    respond_to do |format|
      if @banner_img.save
        format.html { redirect_to @banner_img, notice: 'Banner img was successfully created.' }
        format.json { render json: @banner_img, status: :created, location: @banner_img }
      else
        format.html { render action: "new" }
        format.json { render json: @banner_img.errors, status: :unprocessable_entity }
      end
    end

    # PUT /banner_imgs/1
    # PUT /banner_imgs/1.json
    def update
      uploaded_io = params[:banner_img][:filetmp]
      if uploaded_io != nil
        @filepath = rand(0xffffff).to_s + uploaded_io.original_filename
        File.open(Rails.root.join('public', 'uploads', 'banner', @filepath), 'wb') do |file|
          file.write(uploaded_io.read)
        end
        params[:banner_img].delete('filetmp')
        params[:banner_img][:path] = '/uploads/banner/' + @filepath
      end

      @banner_img = BannerImg.find(params[:id])

      respond_to do |format|
        if @banner_img.update_attributes(params[:banner_img])
          format.html { redirect_to @banner_img, notice: 'Banner img was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: "edit" }
          format.json { render json: @banner_img.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # DELETE /banner_imgs/1
  # DELETE /banner_imgs/1.json
  def destroy
    @banner_img = BannerImg.find(params[:id])
    @banner_img.destroy

    respond_to do |format|
      format.html { redirect_to banner_imgs_url }
      format.json { head :no_content }
    end
  end

  def up
    @current = BannerImg.where('nindex = ' + params[:id]).first()
    @pre = BannerImg.where('nindex < ' + params[:id]).order('nindex').last()
    @tmp = @pre.nindex
    @pre.nindex = @current.nindex
    @current.nindex = @tmp

    @current.save
    @pre.save

    respond_to do |format|
      format.html { redirect_to banner_imgs_url }
      format.json { head :no_content }
    end
  end

  def down
    @current = BannerImg.where('nindex = ' + params[:id]).first()
    @next = BannerImg.where('nindex > ' + params[:id]).order('nindex').first()
    @tmp = @next.nindex
    @next.nindex = @current.nindex
    @current.nindex = @tmp

    @current.save
    @next.save

    respond_to do |format|
      format.html { redirect_to banner_imgs_url }
      format.json { head :no_content }
    end
  end
end
