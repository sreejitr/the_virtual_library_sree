class LibraryebooksController < ApplicationController
  before_action :set_libraryebook, only: [:show, :edit, :update, :destroy]

  def index
    @libraryebooks = Libraryebook.all
  end

  def show
    @libraryebook = Libraryebook.find(params[:id])
    session[:ebookid] = params[:id]
    @relationshp = current_user.relationshps.build if signed_in?
    respond_to do |format|
      format.html
      format.json { render json: @libraryebook}
      format.xml {render xml: @libraryebook}
    end
  end

  def new
    @libraryebook = Libraryebook.new
  end

  def edit
  end

  def create
    @libraryebook = Libraryebook.new(libraryebook_params)

    respond_to do |format|
      if @libraryebook.save
        format.html { redirect_to @libraryebook, notice: 'Libraryebook was successfully created.' }
        format.json { render action: 'show', status: :created, location: @libraryebook }
      else
        format.html { render action: 'new' }
        format.json { render json: @libraryebook.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @libraryebook.update(libraryebook_params)
        format.html { redirect_to @libraryebook, notice: 'Libraryebook was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @libraryebook.errors, status: :unprocessable_entity }
      end
    end
  end

  def loan
    session[:ebookid] = params[:id]
    redirect_to loan_libraryebook_path(@libraryebook)
  end

  def destroy
    @libraryebook.destroy
    respond_to do |format|
      format.html { redirect_to libraryebooks_url }
      format.json { head :no_content }
    end
  end

  private
    def set_libraryebook
      @libraryebook = Libraryebook.find(params[:id])
    end

    def libraryebook_params
      params.require(:libraryebook).permit(:name, :author, :genre, :abstract, :loanamount)
    end
end
