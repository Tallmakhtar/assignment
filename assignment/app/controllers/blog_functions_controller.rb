class BlogFunctionsController < ApplicationController
   before_action :set_blog, only: [:show, :edit, :update, :destroy]
  def index
    @blog_functions = BlogFunction.all
  end

  def new
    if params[:back]
      @blog_function = BlogFunction.new(function_params)
    else
      @blog_function = BlogFunction.new
    end
  end
  
  
  def create
    @blog_function = BlogFunction.new(function_params)
    if @blog_function.save
      # Switch to the list screen and display a message saying "You have created new blog!"
      redirect_to blog_functions_path, notice: "You have created new blog_function!!!"
    else
      # Redraw the input form.
      render 'new'
    end
  end
  

  def show
    @blog_function = BlogFunction.find(params[:id])
  end


  def edit
     @blog_function = BlogFunction.find(params[:id])
  end


  def update
    @blog_function = BlogFunction.find(params[:id])
    if @blog_function.update(function_params)
      redirect_to blog_functions_path notice: 'you have updated this blog_function!!'
      else render 'edit'
    end
  end


  def destroy
    @blog_function.destroy
    redirect_to blog_functions_path notice: 'you have deleted one blog_function!!'
  end
  
  # def confirm
  #     @blog_function = BlogFunction.new(function_params)
  #   render :new if @blog_function.invalid?
  # end
  # end
  
  
  private
  def function_params
    params.require(:blog_function).permit(:name, :email, :content)
    
  end
  
   def set_blog
      @blog_function = BlogFunction.find(params[:id])
   end
end
