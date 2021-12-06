class BeveragesController < ApplicationController
  before_action :set_beverage, only: %i[ show edit update destroy ]

  # GET /beverages or /beverages.json
  def index
    @beverages = Beverage.all
  end

  # GET /beverages/1 or /beverages/1.json
  def show
  end

  # GET /beverages/new
  def new
    @beverage = Beverage.new
  end

  # GET /beverages/1/edit
  def edit
  end

  # POST /beverages or /beverages.json
  def create
    @beverage = Beverage.new(beverage_params)

    respond_to do |format|
      if @beverage.save
        Product.create(productable_type:"Beverage" , productable_id:@beverage.id)
        format.html { redirect_to @beverage, notice: "Beverage was successfully created." }
        format.json { render :show, status: :created, location: @beverage }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @beverage.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /beverages/1 or /beverages/1.json
  def update
    respond_to do |format|
      if @beverage.update(beverage_params)
        format.html { redirect_to @beverage, notice: "Beverage was successfully updated." }
        format.json { render :show, status: :ok, location: @beverage }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @beverage.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /beverages/1 or /beverages/1.json
  def destroy
    Product.destroy(@beverage.product.id)
    @beverage.destroy
    respond_to do |format|
      format.html { redirect_to beverages_url, notice: "Beverage was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_beverage
      @beverage = Beverage.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def beverage_params
      params.require(:beverage).permit(:name, :price)
    end
end
