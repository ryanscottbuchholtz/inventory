class InventoriesController < ApplicationController
  before_action :set_inventory, only: [:show]

  def new
    @inventory = Inventory.new
  end

  def show
  end

  def create
    @inventory = Inventory.new(inventory_params)

    respond_to do |format|
      if @inventory.save
        format.html { redirect_to @inventory, notice: 'Inventory was successfully submitted.'}
      else
        format.html { render action: 'new' }
      end
    end
  end

  private

  def inventory_params
    params.require(:inventory).permit(:title, :description, :quantity)
  end

  def set_inventory
    @inventory = Inventory.find(params[:id])
  end


end
