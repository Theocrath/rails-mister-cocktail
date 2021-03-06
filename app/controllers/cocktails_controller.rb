class CocktailsController < ApplicationController
  before_action :set_cocktail, only: :show

  def index
    @cocktails = Cocktail.all
  end

  def show
    @doses = Dose.where(cocktail_id: @cocktail.id)
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)

    if @cocktail.save
      redirect_to cocktail_path(@cocktail), notice: 'Created a cocktail, mon!'
    else
      render :new
    end
  end

  def destroy
    @cocktail = Cocktail.find(params[:id])
    @cocktail.destroy
    redirect_to cocktails_path
  end

  private

  def set_cocktail
    @cocktail = Cocktail.find(params[:id])
  end

  def cocktail_params
    params.require(:cocktail).permit(:name, :photo)
  end
end
