class OrderlinesController < ApplicationController
  before_action :set_orderline, only: %i[ show edit update destroy ]

  # GET /orderlines or /orderlines.json
  def index
    @orderlines = Orderline.all
  end

  # GET /orderlines/1 or /orderlines/1.json
  def show
  end

  # GET /orderlines/new
  def new
    @orderline = Orderline.new
  end

  # GET /orderlines/1/edit
  def edit
  end

  # POST /orderlines or /orderlines.json
  def create
    @orderline = Orderline.new(orderline_params)

    respond_to do |format|
      if @orderline.save
        format.html { redirect_to @orderline, notice: "Orderline was successfully created." }
        format.json { render :show, status: :created, location: @orderline }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @orderline.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orderlines/1 or /orderlines/1.json
  def update
    respond_to do |format|
      if @orderline.update(orderline_params)
        format.html { redirect_to @orderline, notice: "Orderline was successfully updated." }
        format.json { render :show, status: :ok, location: @orderline }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @orderline.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orderlines/1 or /orderlines/1.json
  def destroy
    @orderline.destroy
    respond_to do |format|
      format.html { redirect_to orderlines_url, notice: "Orderline was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_orderline
      @orderline = Orderline.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def orderline_params
      params.require(:orderline).permit(:order_id, :product_id, :quantity, :price)
    end
end
