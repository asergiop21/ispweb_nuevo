class CustomerBandwidthsController < ApplicationController
  # GET /customer_bandwidths
  # GET /customer_bandwidths.json
  def index
    @customer_bandwidths = CustomerBandwidth.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @customer_bandwidths }
    end
  end

  # GET /customer_bandwidths/1
  # GET /customer_bandwidths/1.json
  def show
    @customer_bandwidth = CustomerBandwidth.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @customer_bandwidth }
    end
  end

  # GET /customer_bandwidths/new
  # GET /customer_bandwidths/new.json
  def new
    @customer_bandwidth = CustomerBandwidth.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @customer_bandwidth }
    end
  end

  # GET /customer_bandwidths/1/edit
  def edit
    @customer_bandwidth = CustomerBandwidth.find(params[:id])
  end

  # POST /customer_bandwidths
  # POST /customer_bandwidths.json
  def create
    @customer_bandwidth = CustomerBandwidth.new(params[:customer_bandwidth])

    respond_to do |format|
      if @customer_bandwidth.save
        format.html { redirect_to @customer_bandwidth, notice: 'Customer bandwidth was successfully created.' }
        format.json { render json: @customer_bandwidth, status: :created, location: @customer_bandwidth }
      else
        format.html { render action: "new" }
        format.json { render json: @customer_bandwidth.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /customer_bandwidths/1
  # PUT /customer_bandwidths/1.json
  def update
    @customer_bandwidth = CustomerBandwidth.find(params[:id])

    respond_to do |format|
      if @customer_bandwidth.update_attributes(params[:customer_bandwidth])
        format.html { redirect_to @customer_bandwidth, notice: 'Customer bandwidth was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @customer_bandwidth.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /customer_bandwidths/1
  # DELETE /customer_bandwidths/1.json
  def destroy
    @customer_bandwidth = CustomerBandwidth.find(params[:id])
    @customer_bandwidth.destroy

    respond_to do |format|
      format.html { redirect_to customer_bandwidths_url }
      format.json { head :no_content }
    end
  end
end
