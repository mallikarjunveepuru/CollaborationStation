class WikisController < ApplicationController
  before_action :find_wiki, only: [:show, :edit, :update, :destroy]

  def index
    @wikis = Wiki.all
  end

  def show
    authorize @wiki
  end

  def new
    @wiki = Wiki.new
    authorize @wiki
  end

  def edit
    authorize @wiki
  end

  def create
    @wiki = Wiki.new(wiki_params)
    authorize @wiki
    if @wiki.save
      redirect_to @wiki, notice: "Your Wiki was saved successfully."
    else
      flash[:error] = "Error creating wiki, please try again."
      render :new
    end
  end

  def update
    if @wiki.update_attributes(wiki_params)
      redirect_to @wiki
    else
      flash[:error] = "Error updating wiki, please try again."
      render :edit
    end
  end

  def destroy
    if @wiki.destroy
      flash[:notice] = "Wiki was sucessfully deleted."
      redirect_to @wiki
    else
      flash[:error] = "There was an error deleting the wiki. Please try again."
      render :show
    end
  end

private

  def find_wiki
    @wiki = Wiki.find(params[:id])
  end

  def wiki_params
    params.require(:wiki).permit(:title, :body, :private)
  end

end
