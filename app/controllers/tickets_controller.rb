class TicketsController < ApplicationController
  # GET /tickets
  # GET /tickets.json
 before_filter :load_customer, :except=>[:all]
 
  def index
    
#    @tickets = @customer.tickets.arrange
    @tickets = @customer.tickets

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tickets }
    end
  end

  # GET /tickets/1
  # GET /tickets/1.json
  def show
    
    @ticket = @customer.tickets.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @ticket }
    end
  end

  # GET /tickets/new
  # GET /tickets/new.json
  def new
      

    @ticket = @customer.tickets.new(:parent_id => params[:parent_id])
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @ticket }
    end
  end

  # GET /tickets/1/edit
  def edit
    
    @ticket = @customer.tickets.find(params[:id])
  
  end

  # POST /tickets
  # POST /tickets.json
  def create
    
    @ticket = @customer.tickets.new(params[:ticket])

    respond_to do |format|
      if @ticket.save
        format.html { redirect_to [@customer, @ticket], notice: 'Ticket was successfully created.' }
        format.json { render json: [@customer, @ticket], status: :created, location: @ticket }
      else
        format.html { render action: "new" }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tickets/1
  # PUT /tickets/1.json
  def update
    @ticket = @customer.tickets.find(params[:id])

    respond_to do |format|
      if @ticket.update_attributes(params[:ticket])
        format.html { redirect_to [@customer, @ticket], notice: 'Ticket was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tickets/1
  # DELETE /tickets/1.json
  def destroy
    @ticket = Ticket.find(params[:id])
    @ticket.destroy

    respond_to do |format|
      format.html { redirect_to tickets_url }
      format.json { head :no_content }
    end
  end

  def all
    @tickets = Ticket.where(status: false )

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tickets }
    end
  end
private
  def load_customer
    @customer = Customer.find(params[:customer_id])
  end
end
