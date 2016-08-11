class IngredientsController < ApplicationController
  before_action :set_ingredient, only: [:new, :edit, :update, :destroy]
  before_action :find_dose, only: [:new, :edit, :create, :update, :destroy]

  def index
    @ingredients = Ingredient.all
  end

  def new
    @ingredient = Ingredient.new
  end

  def edit
  end

  def create
    @ingredient = @dose.ingredients.build(ingredient_params)
    if @ingredient.save
      redirect_to dose_path(@dose)
    else
      render :new
    end
  end

  def update
    if @ingredient.update(ingredient_params)
      redirect_to dose_path(@dose)
    else
      render :edit
    end
  end

  def destroy
    @ingredient.destroy
    redirect_to dose_path(@dose)
  end

  private
    def set_ingredient
      @ingredient = Ingredient.find(params[:id])
    end

    def find_dose
      @dose = Dose.find(params[:dose_id])
    end

    def ingredient_params
      params.require(:ingredient).permit(:name)
    end
end
