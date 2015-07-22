class CollaboratorsController < ApplicationController
  before_action :get_wiki

  def create
    @collaborator = Collaborator.new(wiki_id: @wiki.id, user_id: params[:user_id])
    if @collaborator.save
      flash[:notice] = "Your wiki was updated."
      redirect_to edit_wiki_path(@wiki)
    else
      flash[:error] = "There was an error updating the wiki, please try again."
      render :show
    end
  end

  def destroy
    @collaborator = Collaborator.find(params[:id])
    if @collaborator.destroy
      flash[:notice] = "Your wiki was sucessfully updated."
      redirect_to edit_wiki_path(@wiki)
    else
      flash[:error] = "There was an error. Please try again."
      render :show
    end
  end


    private

    def get_wiki
      @wiki = wiki.find(params[:wiki_id])
    end

end
