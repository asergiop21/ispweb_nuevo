class AccountsReceivablesController < ApplicationController
  # GET /accounts_receivables
  # GET /accounts_receivables.json
 before_filter :load_customer
 
 def index
    @accounts_receivables = @customer.accounts_receivable.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @accounts_receivables }
    end
  end

  # GET /accounts_receivables/1
  # GET /accounts_receivables/1.json
  def show
    @accounts_receivable = @customer.accounts_receivable.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @accounts_receivable }
    end
  end

  # GET /accounts_receivables/new
  # GET /accounts_receivables/new.json
  def new
    @accounts_receivable = @customer.accounts_receivable.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @accounts_receivable }
    end
  end

  # GET /accounts_receivables/1/edit
  def edit
    @accounts_receivable = @customer.accounts_receivable.find(params[:id])
  end

  # POST /accounts_receivables
  # POST /accounts_receivables.json
  def create
    @accounts_receivable = @customer.accounts_receivable.new(params[:accounts_receivable].merge(:user_id => current_user.id))

    respond_to do |format|
      if @accounts_receivable.save
        format.html { redirect_to customer_accounts_receivables_path(@customer), notice: 'Accounts receivable was successfully created.' }
        format.json { render json: @accounts_receivable, status: :created, location: @accounts_receivable }
      else
        format.html { render action: "new" }
        format.json { render json: @accounts_receivable.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /accounts_receivables/1
  # PUT /accounts_receivables/1.json
  def update
    @accounts_receivable = @customer.accounts_receivable.find(params[:id])

    respond_to do |format|
      if @accounts_receivable.update_attributes(params[:accounts_receivable])
        format.html { redirect_to @accounts_receivable, notice: 'Accounts receivable was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @accounts_receivable.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /accounts_receivables/1
  # DELETE /accounts_receivables/1.json
  def destroy
    @accounts_receivable = @customer.accounts_receivable.find(params[:id])
    @accounts_receivable.destroy

    respond_to do |format|
      format.html { redirect_to accounts_receivables_url }
      format.json { head :no_content }
    end
  end

private
  def load_customer
    @customer = Customer.find(params[:customer_id])
  end

end
