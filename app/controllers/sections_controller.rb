class SectionsController < ApplicationController
  
  layout 'admin'
  
  def index
    list 
    render("list")
  end
  
  def list
    @sections = Section.order("sections.position ASC")
  end
  
  def show
    @section = Section.find(params[:id])
  end
  
  def new
    @section = Section.new#(:name => 'default')
    
    #count form helper
    @section_count = Section.count + 1
  end
  
  def create
    # Instantiate a new object using form parameters
    @section = Section.new(params[:section])
    
    # Save the object
    if @section.save
      flash[:notice] = "Section created."
      #If save succeeds, redirect to the list action
      redirect_to(:action => 'list')
    else
      # If save fails, redisplay the form so user can fix problems
      #count form helper
      @section_count = Section.count + 1
      render('new')
    end
  end
  
  def edit
      @section = Section.find(params[:id])
      
      #count form helper
      @section_count = Section.count
  end
  
  def update
    # Find object using form parameters
    @section = Section.find(params[:id])
    
    # Update the object
    if @section.update_attributes(params[:section])
      #If update succeeds, redirect to the list action
      flash[:notice] = "Section updated."
      redirect_to(:action => 'show', :id => @section.id)
    else
      # If save fails, redisplay the form so user can fix problems
      #count form helper
      @section_count = Section.count
      render('edit')
    end
    
  end
  
  def delete
     @section = Section.find(params[:id])
  end
  
  def destroy
    #@section = Section.find(params[:id])
    #@section.destroy
    # or just use (without @section instance variables)
    Section.find(params[:id]).destroy
    
    #then redirect back to the subject list
    flash[:notice] = "Section destroyed."
    redirect_to(:action => 'list')
  end
  
end
