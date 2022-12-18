class LostsController < ApplicationController


  def search
    #search_keywords
  end

  def search_results # displays the results     #@losts = Lost.keyword_search(params[:search_keywords])
    keywords = "%" + params[:search_keywords] + "%"
    @losts = Lost.where("lost_item_name LIKE ? OR lost_item_desc LIKE ?", keywords, keywords).order("losts.lost_date DESC")
  end

  def list
  	@losts = Lost.order("losts.lost_date DESC")
  end

  def new
  	@lost = Lost.new
  end

  #################################
  def show_one
  	@lost = Lost.find(params[:id])
  end

  def show_two
    redirect_to :controller => "founds", :action => "show_two"
  end
  #################################

  def create
  	@lost = Lost.new(lost_params)
    #@date = Lost.find(date_params)
    #if @date < Time.now.strftime("%Y-%m-%d")
  	   @lost.save
  		   if @lost.save #@lost = Lost.find(auth_params)      #flash[:notice] = @lost
           redirect_to :controller => "losts", :action => "list" #render(:created_at)
         else
  			    render('new')
  	     end
    #else
    #  render("new")
    #end

  end

  def delete
      @lost = Lost.find(params[:id])
  end

  def destroy
      @lost = Lost.find(params[:id]).destroy
      flash[:notice] = "Lost item destroyed"
      redirect_to :controller => "losts", :action => "list"
  end

  def auth
   @auth = Lost.find(params[:id])
  end

  def auth_t
    @auth = params[:id]
    @key = params[:id]
    if @auth = Lost.where("lost_auth_key = ?",@key)
      render ("edit")
    else
      render ("list")
    end
  end

  def edit
    @lost = Lost.find(params[:id])
  end

  def update
    @lost = Lost.find(params[:id])
    if @lost.update_attributes(lost_params)
      flash[:notice] = "Lost item updated"
      redirect_to(:action => 'list')
    else
      render('edit')
    end
  end


  private
  def lost_params
  	params.require(:lost).permit(:lost_item_name, :lost_item_desc, :lost_phone_no, :lost_date, :lost_place, :created_at)
  end

  def date_params
    params.require(:lost).permit(:lost_date)
  end
end