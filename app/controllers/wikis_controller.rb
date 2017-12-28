class WikisController < ApplicationController
  after_action :verify_authorized

  def index
    authorize Wiki
    @wikis = Wiki.all
  end

  def show
    authorize Wiki
    @wiki = Wiki.find(params[:id])
  end

  def new
    authorize Wiki
    @wiki = Wiki.new
  end

  def create
    authorize Wiki
    @wiki = Wiki.new
    @wiki.title = params[:wiki][:title]
    @wiki.body = params[:wiki][:body]
    @wiki.user = current_user

    if @wiki.save
      flash[:notice] = "Wiki was saved."
      redirect_to [@wiki]
    else
      flash.now[:alert] = "There was an error saving the wiki. Please try again."
      render :new
    end
  end

  def edit
    authorize Wiki
    @wiki = Wiki.find(params[:id])
  end

  def update
    authorize Wiki
    @wiki = Wiki.find(params[:id])
    @wiki.title = params[:wiki][:title]
    @wiki.body = params[:wiki][:body]

    if @wiki.save
      flash[:notice] = "Wiki was updated."
      redirect_to [@wiki]
    else
      flash.now[:alert] = "There was an error saving the wiki. Please try again."
      render :edit
    end
  end

  def destroy
    authorize Wiki
    @wiki = Wiki.find(params[:id])

    if @wiki.destroy
      flash[:notice] = "\"#{@wiki.title}\" was deleted successfully."
      redirect_to wikis_path
    else
      flash.now[:alert] = "There was an error deleting the wiki."
      render :show
    end
  end
end
