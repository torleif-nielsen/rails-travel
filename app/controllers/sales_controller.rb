class SalesController < ApplicationController
  before_action :set_sale, only: [:show, :edit, :update, :destroy]
  before_action :set_agents, only: [:new, :edit, :create]
  before_action :set_destinations, only: [:new, :edit, :create]
  # GET /sales
  # GET /sales.json
  def index
    @sales = Sale.all

    if params[:agent_id].present? 
      @sales = @sales.where(agent_id: params[:agent_id].to_i)
    end

    if params[:destination_id].present? 
      @sales = @sales.where(destination_id: params[:destination_id].to_i)
    end

    if params[:amount_min].present? 
      @sales = @sales.where("amount > ?", params[:amount_min].to_f)
    end

    if params[:amount_max].present? 
      @sales = @sales.where("amount < ?", params[:amount_max].to_f)
    end

    respond_to do |format|
      format.html {}
      format.js { render file: "sales/filter_sales.js.erb" }
    end
  end

  # GET /sales/1
  # GET /sales/1.json
  def show

  end
  # GET /sales/new
  def new
    @sale = Sale.new
  end

  # GET /sales/1/edit
  def edit
  end

  # POST /sales
  # POST /sales.json
  def create
    @sale = Sale.new(sale_params)

    respond_to do |format|
      if @sale.save
        format.html { redirect_to @sale, notice: 'Sale was successfully created.' }
        format.json { render :show, status: :created, location: @sale }
      else
        format.html { render :new }
        format.json { render json: @sale.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sales/1
  # PATCH/PUT /sales/1.json
  def update
    respond_to do |format|
      if @sale.update(sale_params)
        format.html { redirect_to @sale, notice: 'Sale was successfully updated.' }
        format.json { render :show, status: :ok, location: @sale }
      else
        format.html { render :edit }
        format.json { render json: @sale.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sales/1
  # DELETE /sales/1.json
  def destroy
    @sale.destroy
    respond_to do |format|
      format.html { redirect_to sales_url, notice: 'Sale was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sale
      @sale = Sale.find(params[:id])
    end

    def set_agents
      @agents = Agent.all.order(:name)
    end

    def set_destinations
      @destinations = Destination.all.order(:name)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sale_params
      params.require(:sale).permit(:amount, :agent_id, :destination_id)
    end
end
