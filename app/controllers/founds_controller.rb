class FoundsController < ApplicationController
  def index
  	list
  	render('list')
  end

  def search #displays a search form
    #search_keywords
  end

  def auth_key
    #defines auth_key
  end

  def search_result # displays the results
    keywords = "%" + params[:search_keyword] + "%"
    @founds = Found.where("found_item_name LIKE ? OR found_item_desc LIKE ?", keywords, keywords).order("founds.found_date DESC")
  end

  def list
  	@founds = Found.order("founds.found_date DESC")
  end

  def new
  	@found = Found.new
  end

  ###########################
  def show_one
    redirect_to :controller => "losts", :action => "show_one"
  end

  def show_two
  	@found = Found.find(params[:id])
  end
  ###########################

  def create
  	#instantiate a new object using form parameters
  	@found = Found.new(found_params)

  	#Save the object
  	@found.save

  		#If saved
  		if @found.save
        #flash[:notice] = "Item details have been saved"
  			redirect_to(:action => 'list')
        #render('auth_key')
  		#If not saved, due to any error
  		else
  			render('new')

  		end
    end

  def delete
      @found = Found.find(params[:id])
    end

  def destroy
      @found = Found.find(params[:id]).destroy
      redirect_to(:action => 'list')
  end

  def edit
        @found = Found.find(params[:id])
  end

  def update
      @found = Found.find(params[:id])
      if @found.update_attributes(found_params)
        flash[:notice] = "Found item updated"
        redirect_to(:action => 'list')
      else
        render('edit')
      end
  end

    private
    def found_params
  	   params.require(:found).permit(:found_item_name, :found_item_desc, :found_phone_no, :found_date, :found_place, :created_at)
    end

end
