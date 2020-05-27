class PortfoliosController < ApplicationController
  before_action :set_portfolio, only: [:show, :edit, :update, :destroy]
  layout "portfolio"

  def index
    @page_header = "Portfolios"
    @seo_keywords = "Portfolio stuff and other key words"
    @portfolio_items = Portfolio.all
  end

  def show
  end

  def edit
    3.times { @portfolio.technologies.build}

    end

  def update
    respond_to do |format|
      if @portfolio.update(portfolio_params)
        # QUESTION: why does .update method work here .. where is it written? ACTIVE RECORD?
        format.html { redirect_to portfolio_show_path(@portfolio), notice: 'portfolio was successfully updated.' }
        format.json { render :show, status: :ok, location: @portfolio }
      else
        format.html { render :edit }
        format.json { render json: @portfolio.errors, status: :unprocessable_entity }
      end
    end
  end

  def new
    @portfolio = Portfolio.new
    3.times { @portfolio.technologies.build}
  end

  def destroy
    @portfolio.technologies.all.each {|t| t.destroy}
    @portfolio.destroy
    respond_to do |format|
      format.html { redirect_to portfolios_url, notice: 'Portfolio was successfully destroyed.' }
      format.json { head :no_content }
    end
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

def set_portfolio
  @portfolio = Portfolio.find_by(id: params[:id])
end

def portfolio_params
  params.require(:portfolio).permit(:title, :subtitle, :body, technologies_attributes: [:name])
end
