class CustomersController < ApplicationController
  before_action :set_customer, only: %i[show edit update destroy ban unban]

  # GET /customers
  # GET /customers.json
  def index
    @customers = Customer.not_banned
  end

  def banned_index
    @customers = Customer.got_ban

    render :banned
  end

  # GET /customers/1
  # GET /customers/1.json
  def show
  end

  # GET /customers/new
  def new
    @customer = Customer.new
  end

  # GET /customers/1/edit
  def edit
  end

  # POST /customers
  # POST /customers.json
  def create
    @customer = Customer.new(customer_params)

    respond_to do |format|
      if @customer.save
        format.html { redirect_to @customer, notice: 'Customer was successfully created.' }
        format.json { render :show, status: :created, location: @customer }
      else
        format.html { render :new }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /customers/1
  # PATCH/PUT /customers/1.json
  def update
    respond_to do |format|
      if @customer.update(customer_params)
        format.html { redirect_to @customer, notice: 'Customer was successfully updated.' }
        format.json { render :show, status: :ok, location: @customer }
      else
        format.html { render :edit }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /customers/1
  # DELETE /customers/1.json
  def destroy
    @customer.destroy
    respond_to do |format|
      format.html { redirect_to customers_url, notice: 'Customer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def ban
    @customer.ban_it
    respond_to do |format|
      format.html { redirect_to customers_url, notice: 'Customer was successfully banned.' }
      format.json { head :no_content }
    end
  end

  def unban
    @customer.unban_it
    respond_to do |format|
      format.html { redirect_to banned_url, notice: 'Customer was successfully unbanned.' }
      format.json { head :no_content }
    end
  end

  def ban_by_phone
    @customer = Customer.search_by_phone(params[:phone])

    unless @customer.any?
      return respond_to do |format|
        format.html { redirect_to banned_url, notice: 'Customer not found.' }
        format.json { head :no_content }
      end
    end

    @customer.each(&:ban_it)

    respond_to do |format|
      format.html { redirect_to banned_url, notice: 'Customer was successfully banned.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_customer
    @customer = Customer.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def customer_params
    params.require(:customer).permit(:name, :phone, :description, :banned)
  end
end
