class PortfoliosController < ApplicationController

	def index
		@portfolio_items = Portfolio.all
	end

	def new
		@portfolio_items = Portfolio.new
	end

	def edit
		@portfolio_items = Portfolio.find(params[:id])
	end


	def create
	    @portfolio_items = Portfolio.new(params.require(:portfolio).permit(:title, :subtitle, :body))

	    respond_to do |format|
	      if @portfolio_items.save
	        format.html { redirect_to portfolios_path, notice: 'Your portfolio item is now live.' }
	      else
	        format.html { render :new }
	      end
	    end
	end

	 def update
	@portfolio_items = Portfolio.find(params[:id])	
    respond_to do |format|
      if @portfolio_items.update(params.require(:portfolio).permit(:title, :subtitle, :body))
        format.html { redirect_to portfolios_path, notice: 'Record was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def show
  	@portfolio_items = Portfolio.find(params[:id])	
  end

  def destroy
  	#Perform the lookup
  	@portfolio_items = Portfolio.find(params[:id])	

  	#delete the record
    @portfolio_items.destroy

    #redirect to index page
    respond_to do |format|
      format.html { redirect_to portfolios_path, notice: 'Portfolio item was successfully Deleted.' }
    end
  end

# end of controller
end    