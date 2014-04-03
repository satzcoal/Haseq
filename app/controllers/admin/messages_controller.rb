class Admin::MessagesController < ApplicationController
  # GET /messages
  # GET /messages.json
  def index
    @messages = Admin::Message.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @messages }
    end
  end

  # GET /messages/1
  # GET /messages/1.json
  def show
    @message = Admin::Message.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @message }
    end
  end

  # GET /messages/new
  # GET /messages/new.json
  def new
    @message = Admin::Message.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @message }
    end
  end

  # GET /messages/1/edit
  def edit
    @message = Admin::Message.find(params[:id])
  end

  # POST /messages
  # POST /messages.json
  def create
    @message = Admin::Message.new(params[:admin_message])

    respond_to do |format|
      if @message.save
        format.html { redirect_to @message, notice: 'Message was successfully created.' }
        format.json { render json: @message, status: :created, location: @message }
      else
        format.html { render action: "new" }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /messages/1
  # PUT /messages/1.json
  def update
    @message = Admin::Message.find(params[:id])

    respond_to do |format|
      if @message.update_attributes(params[:admin_message])
        format.html { redirect_to @message, notice: 'Message was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /messages/1
  # DELETE /messages/1.json
  def destroy
    @message = Admin::Message.find(params[:id])
    @message.destroy

    respond_to do |format|
      format.html { redirect_to admin_messages_url }
      format.json { head :no_content }
    end
  end
end
