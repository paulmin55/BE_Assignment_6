class AuthorsController < ApplicationController
  def index
    @authors = Author.all
  end

  def show
    @author = Author.find_by_id(params[:id])
    @posts = @author.posts
  end

  def new
    @author = Author.new
  end

  def edit
    @author = Author.find_by_id(params[:id])
  end

  def create
    @author = Author.new(params[:author])

    if @author.save
      redirect_to author_path(@author), notice: "Author was created successfully"
    else
      flash[:alert] = "There was an error creating an author"
      render :new
    end
  end

  def update
    @author = Author.find_by_id(params[:id])
    if @author.update_attributes(params[:author])
      redirect_to authors_path, notice: "Author was updated successfully"
    else
      flash[:alert] = "Error!"
      render :edit
    end
  end

  def destroy
    @author = Author.find_by_id(params[:id])

    if @author.destroy
      flash[:notice] = "#{@author.fname} was sucessfully deleted."
    else
      flash[:alert] = "There was an error while attempting to delete this author."
    end

    redirect_to authors_path
  end

end