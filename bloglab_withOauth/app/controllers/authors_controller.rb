class AuthorsController < ApplicationController

before_action :set_author, only: [:show, :edit, :update, :destroy]
  def index
    # @user = User.from_omniauth(env["omniauth.auth"])
    @authors = Author.all
  end

  def new
    @author = Author.new
  end

  def create
    @author = Author.new author_params
    if @author.save
      redirect_to authors_path, flash: { success: "New Author Created!" }
    else
      render :new
    end 
  end

  def show 
    #NOT NEEDED BECAUSE OF before_action callback
    # @author = Author.find params[:id], params[:author_id]

  end

  def edit
    #NOT NEEDED BECAUSE OF before_action callback
    # @author = Author.find params[:id]
  end

  def update
    #NOT NEEDED BECAUSE OF before_action callback
    # @author = Author.find params[:id]
    if @author.update_attributes author_params
        redirect_to author_path(@author), flash: { success: "Author Updated!" }
    else
      render :edit
    end
  end

  def destroy
    author = Author.find params[:id]
    author.destroy
    redirect_to authors_path, flash: { warning: "Author Deleted!" } 
  end
  private
  # Use callbacks to share common setup or constraints between actions.
  def set_author
    @author = Author.find(params[:id])
  end


  def author_params
    params.require(:author).permit(:first_name, :last_name, :age)
  end
end







