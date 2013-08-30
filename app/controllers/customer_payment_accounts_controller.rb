class CustomerPaymentAccountsController < ApplicationController
  # GET /customers_accounts
  # GET /customers_accounts.json
before_filter :load_customer 

  def index
    @customer_payment_accounts = @customer.customer_payment_accounts.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @customer_payment_accounts }
    end
  end

  # GET /customers_accounts/1
  # GET /customers_accounts/1.json
  def show
    @customer_payment_account = @customer.customer_payment_accounts.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @customer_payment_account }
    end
  end

  # GET /customers_accounts/new
  # GET /customers_accounts/new.json
  def new
    @customer_payment_account = @customer.customer_payment_accounts.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @customer_payment_account }
    end
  end

  # GET /customers_accounts/1/edit
  def edit
    @customer_account = @customer.customer_payment_accounts.find(params[:id])
  end

  # POST /customers_accounts
  # POST /customers_accounts.json
  def create
    @customer_payment_account = @customer.customer_payment_accounts.new(params[:customer_payment_account])

    respond_to do |format|
      if @customer_payment_account.save
        format.html { redirect_to [@customer, @customer_payment_account], notice: 'Customer payment account was successfully created.' }
        format.json { render json: @customer_payment_accounts, status: :created, location: @customer_payment_accounts}
      else
        format.html { render action: "new" }
        format.json { render json: @customer_payment_account.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /customers_accounts/1
  # PUT /customers_accounts/1.json
  def update
    @customer_payment_account = @customer.customer_payment_accounts.find(params[:id])

    respond_to do |format|
      if @customer_payment_account.update_attributes(params[:customer_payment_account])
        format.html { redirect_to @customers_account, notice: 'Customer payment account was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @customer_payment_account.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /customers_accounts/1
  # DELETE /customers_accounts/1.json
  def destroy
    @customer_payment_account = @customer.customer_payment_accounts.find(params[:id])
    @customer_payment_account.destroy

    respond_to do |format|
      format.html { redirect_to customers_payment_accounts_url }
      format.json { head :no_content }
    end
  end


private
  def load_customer
    @customer = Customer.find(params[:customer_id])
  end

end
