class IpsController < ApplicationController
  # GET /ips
  # GET /ips.json

before_filter :load_customers

  def index
    @ips = @customer.ips.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @ips }
    end
  end

  # GET /ips/1
  # GET /ips/1.json
  def show
    @ip = @customer.ips.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @ip }
    end
  end

  # GET /ips/new
  # GET /ips/new.json
  def new
    @ip = @customer.ips.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @ip }
    end
  end

  # GET /ips/1/edit
  def edit
    @ip = @customer.ips.find(params[:id])
  end

  # POST /ips
  # POST /ips.json
  def create
    @ip = @customer.ips.new(params[:ip])

    respond_to do |format|
      if @ip.save
        format.html { redirect_to [@customer, @ip], notice: 'Ip was successfully created.' }
        format.json { render json: [@customer, @ip], status: :created, location: @ip }
      else
        format.html { render action: "new"}
        format.json { render json: @ip.errors, status: :unprocessable_entity }
  end

end
end
  # PUT /ips/1
  # PUT /ips/1.json
  def update
    @ip = @customer.ips.find(params[:id])

    respond_to do |format|
      if @ip.update_attributes(params[:ip])
        format.html { redirect_to @ip, notice: 'Ip was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @ip.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ips/1
  # DELETE /ips/1.json
  def destroy
    @ip = @customer.ips.find(params[:id])
    @ip.destroy

    respond_to do |format|
      format.html { redirect_to customer_ips_path(@customer.id) }
      format.json { head :no_content }
    end
  end


  def load_customers
    @customer = Customer.find(params[:customer_id])
  end

end
