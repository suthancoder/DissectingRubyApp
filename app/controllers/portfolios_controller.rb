class PortfoliosController < ApplicationController
  def index
    @portfolio_items = Portfolio.all
  end

  def show
  end


  def new
    @portfolio = Portfolio.new
  end

  def create

    @portfolio = Portfolio.new(portfolio_params)

    respond_to do |format|
      if @portfolio.save
        format.html { redirect_to portfolios_path, notice: 'portfolio was successfully created.' }
        format.json { render :show, status: :created, location: @portfolio }
      else
        format.html { render :new }
        format.json { render json: @portfolio.errors, status: :unprocessable_entity }
      end
    end
  end

end

private

def portfolio_params
  params.require(:portfolio).permit(:title, :subtitle, :body)
end
