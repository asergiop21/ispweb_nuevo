class MikrotiksController < ApplicationController
  # GET /mikrotiks
  # GET /mikrotiks.json
  def index
    @mikrotiks = Mikrotik.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @mikrotiks }
    end
  end

  # GET /mikrotiks/1
  # GET /mikrotiks/1.json
  def show
    @mikrotik = Mikrotik.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @mikrotik }
    end
  end

  # GET /mikrotiks/new
  # GET /mikrotiks/new.json
  def new
    @mikrotik = Mikrotik.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @mikrotik }
    end
  end

  # GET /mikrotiks/1/edit
  def edit
    @mikrotik = Mikrotik.find(params[:id])
  end

  # POST /mikrotiks
  # POST /mikrotiks.json
  def create
    @mikrotik = Mikrotik.new(params[:mikrotik])

    respond_to do |format|
      if @mikrotik.save
        format.html { redirect_to @mikrotik, notice: 'Mikrotik was successfully created.' }
        format.json { render json: @mikrotik, status: :created, location: @mikrotik }
      else
        format.html { render action: "new" }
        format.json { render json: @mikrotik.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /mikrotiks/1
  # PUT /mikrotiks/1.json
  def update
    @mikrotik = Mikrotik.find(params[:id])

    respond_to do |format|
      if @mikrotik.update_attributes(params[:mikrotik])
        format.html { redirect_to @mikrotik, notice: 'Mikrotik was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @mikrotik.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mikrotiks/1
  # DELETE /mikrotiks/1.json
  def destroy
    @mikrotik = Mikrotik.find(params[:id])
    @mikrotik.destroy

    respond_to do |format|
      format.html { redirect_to mikrotiks_url }
      format.json { head :no_content }
    end
  end
end
