class LoansController < ApplicationController
  # GET /loans
  # GET /loans.json
before_filter :load_customers, :except =>[:loan_pending]
  def index
    @loans = @customer.loans.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @loans }
    end
  end

  # GET /loans/1
  # GET /loans/1.json
  def show
    @loan = @customer.loans.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @loan }
    end
  end

  # GET /loans/new
  # GET /loans/new.json
  def new
    @loan = @customer.loans.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @loan }
    end
  end

  # GET /loans/1/edit
  def edit
    @loan = @customer.loans.find(params[:id])
  end

  # POST /loans
  # POST /loans.json
  def create
    @loan = @customer.loans.new(params[:loan].merge(:user_id => current_user.id))

    respond_to do |format|
      if @loan.save
        format.html { redirect_to [@customer, @loan], notice: 'Loan was successfully created.' }
        format.json { render json: [@customer, @loan], status: :created, location: @loan }
      else
        format.html { render action: "new" }
        format.json { render json: @loan.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /loans/1
  # PUT /loans/1.json
  def update
    @loan = @customer.loans.find(params[:id])

    respond_to do |format|
      if @loan.update_attributes(params[:loan])
        format.html { redirect_to [@customer, @loan], notice: 'Loan was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @loan.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /loans/1
  # DELETE /loans/1.json
  def destroy
    @loan = @customer.loans.find(params[:id])
    @equipment_id = @loan.equipment_id

    @equipment = Equipment.find(@equipment_id)
    respond_to do |format|
      
    @loan.update_attributes(:status_loan => 'false')
     @equipment.update_attributes(:status => 'STOCK')

      format.html { redirect_to customer_loans_url }
      format.json { head :no_content }
    end
  end

  def load_customers
    @customer = Customer.find(params[:customer_id])
  end
 
  def loan_pending
    @loans = Loan.where(confirmation_loan: false)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @loans }
    end
  end
end
