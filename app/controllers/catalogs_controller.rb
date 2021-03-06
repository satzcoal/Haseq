class CatalogsController < ApplicationController
  # GET /catalogs
  # GET /catalogs.json
  def index
    @catalogs = Catalog.order('nindex')

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @catalogs }
    end
  end

  # GET /catalogs/1
  # GET /catalogs/1.json
  def show
    @catalog = Catalog.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @catalog }
    end
  end

  # GET /catalogs/new
  # GET /catalogs/new.json
  def new
    @catalog = Catalog.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @catalog }
    end
  end

  # GET /catalogs/1/edit
  def edit
    @catalog = Catalog.find(params[:id])
  end

  # POST /catalogs
  # POST /catalogs.json
  def create
    @catalog = Catalog.new(params[:catalog])

    if Catalog.order('nindex').count != 0
      @catalog.nindex = Catalog.order('nindex').last().nindex + 1
    else
      @catalog.nindex = 1
    end

    respond_to do |format|
      if @catalog.save
        format.html { redirect_to @catalog, notice: 'Catalog was successfully created.' }
        format.json { render json: @catalog, status: :created, location: @catalog }
      else
        format.html { render action: "new" }
        format.json { render json: @catalog.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /catalogs/1
  # PUT /catalogs/1.json
  def update
    @catalog = Catalog.find(params[:id])

    respond_to do |format|
      if @catalog.update_attributes(params[:catalog])
        format.html { redirect_to @catalog, notice: 'Catalog was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @catalog.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /catalogs/1
  # DELETE /catalogs/1.json
  def destroy
    @catalog = Catalog.find(params[:id])
    @catalog.destroy

    respond_to do |format|
      format.html { redirect_to catalogs_url }
      format.json { head :no_content }
    end
  end

  def up
    @current = Catalog.where('nindex = ' + params[:id]).first()
    @pre = Catalog.where('nindex < ' + params[:id]).order('nindex').last()
    @tmp = @pre.nindex
    @pre.nindex = @current.nindex
    @current.nindex = @tmp

    @current.save
    @pre.save

    respond_to do |format|
      format.html { redirect_to catalogs_url }
      format.json { render json: @catalogs }
    end
  end

  def down
    @current = Catalog.where('nindex = ' + params[:id]).first()
    @next = Catalog.where('nindex > ' + params[:id]).order('nindex').first()
    @tmp = @next.nindex
    @next.nindex = @current.nindex
    @current.nindex = @tmp

    @current.save
    @next.save

    respond_to do |format|
      format.html { redirect_to catalogs_url }
      format.json { render json: @catalogs }
    end
  end

  def newproduct
    @product = Product.new
    @product.catalog_id = params[:catalog_id]

    respond_to do |format|
      format.html
      format.json { render json: @product }
    end
  end
end
