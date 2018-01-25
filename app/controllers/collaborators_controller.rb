class CollaboratorsController < ApplicationController
  def create
    @wiki = Wiki.find_by id: params[:wiki_id]
    if @wiki.collaborators.any? {|collab| collab.user_id == (User.find_by email: params[:email]).id}
      flash[:alert] = "The collaborator already exists. Please try again."
      redirect_to edit_wiki_path(@wiki.id)
    elsif !User.find_by email: params[:email]
      flash[:alert] = "This user does not exist. Please enter a valid email address."
      redirect_to edit_wiki_path(@wiki.id)
    else
      @collaborator = Collaborator.new
      @collaborator.user_id = (User.find_by email: params[:email]).id
      @collaborator.wiki_id = @wiki.id
      if @collaborator.save
        flash[:notice] = "Collaborator was saved."
        redirect_to edit_wiki_path(@wiki.id)
      else
        flash[:alert] = "There was an error saving the collaborator. Please try again."
        redirect_to edit_wiki_path(@wiki.id)
      end
    end
  end

  def destroy
    @wiki = Wiki.find_by id: params[:id]
    @collaborator = Collaborator.find_by user_id: params[:user_id]

    if @collaborator.destroy
      flash[:notice] = "Collaborator was deleted successfully."
      redirect_to edit_wiki_path(@wiki.id)
    else
      flash.now[:alert] = "There was an error deleting the collaborator."
      redirect_to edit_wiki_path(@wiki.id)
    end
  end
end
