class PagesController < ApplicationController
  
  layout 'admin'
  
  def index
    list 
    render("list")
  end
  
  def list
    @pages = Page.order("pages.position ASC")
  end
  
  def show
    @page = Page.find(params[:id])
  end
  
  def new
    @page = Page.new#(:name => 'default')
    
    #count form helper
    @page_count = Page.count + 1
  end
  
  def create
    # Instantiate a new object using form parameters
    @page = Page.new(params[:page])
    
    # Save the object
    if @page.save
      flash[:notice] = "Page created."
      #If save succeeds, redirect to the list action
      redirect_to(:action => 'list')
    else
      # If save fails, redisplay the form so user can fix problems
      #count form helper
      @page_count = Page.count + 1
      render('new')
    end
  end
  
  def edit
      @page = Page.find(params[:id])
      
      #count form helper
      @page_count = Page.count
  end
  
  def update
    # Find object using form parameters
    @page = Page.find(params[:id])
    
    # Update the object
    if @page.update_attributes(params[:page])
      #If update succeeds, redirect to the list action
      flash[:notice] = "Page updated."
      redirect_to(:action => 'show', :id => @page.id)
    else
      # If save fails, redisplay the form so user can fix problems
      #count form helper
      @page_count = Page.count
      render('edit')
    end
    
  end
  
  def delete
     @page = Page.find(params[:id])
  end
  
  def destroy
    #@page = Page.find(params[:id])
    #@page.destroy
    # or just use (without @page instance variables)
    Page.find(params[:id]).destroy
    
    #then redirect back to the subject list
    flash[:notice] = "Page destroyed."
    redirect_to(:action => 'list')
  end
  
end
