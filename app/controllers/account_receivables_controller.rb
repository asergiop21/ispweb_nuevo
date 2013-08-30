class AccountReceivablesController < ApplicationController
  # GET /accounts_receivables
  # GET /accounts_receivables.json
 before_filter :load_customer
 
 def index
    @account_receivables = @customer.account_receivables.where('enabled = ?', 'false')

     # @a = AccountReceivable.abonos
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @account_receivables }
    end
  end

  # GET /accounts_receivables/1
  # GET /accounts_receivables/1.json
  def show
    @account_receivable = @customer.account_receivables.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @account_receivable }
    end
  end

  # GET /accounts_receivables/new
  # GET /accounts_receivables/new.json
  def new
    @account_receivable = @customer.account_receivables.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @account_receivable }
    end
  end

  # GET /accounts_receivables/1/edit
  def edit
    @account_receivable = @customer.account_receivables.find(params[:id])
  end

  # POST /accounts_receivables
  # POST /accounts_receivables.json
  def create
    @account_receivable = @customer.account_receivables.new(params[:account_receivable].merge(:user_id => current_user.id))

    respond_to do |format|
      if @account_receivable.save
        format.html { redirect_to customer_account_receivables_path(@customer), notice: 'Accounts receivable was successfully created.' }
        format.json { render json: @account_receivable, status: :created, location: @account_receivable }
      else
        format.html { render action: "new" }
        format.json { render json: @account_receivable.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /accounts_receivables/1
  # PUT /accounts_receivables/1.json
  def update
    @account_receivable = @customer.account_receivables.find(params[:id])

    respond_to do |format|
      if @account_receivable.update_attributes(params[:account_receivable])
        format.html { redirect_to @account_receivable, notice: 'Account receivable was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @account_receivable.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /accounts_receivables/1
  # DELETE /accounts_receivables/1.json
  def destroy
    @account_receivable = @customer.account_receivables.find(params[:id])
    @account_receivable.destroy

    respond_to do |format|
      format.html { redirect_to account_receivables_url }
      format.json { head :no_content }
    end
  end

private
  def load_customer
    @customer = Customer.find(params[:customer_id])
  end

end
