class RelationshpsController < ApplicationController
  before_action :signed_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy

  def index
    @relationshp = Relationshp.all
  end

  def new
    @relationshp = Relationshp.new
  end

  def update
    @relationshp.loanstart = Time.now
    @relationshp.loanend = Time.now + 30.days
    if @relationshp.update(libraryebook_params)
       redirect_to @relationshp, notice: 'Libraryebook was successfully renewed.'
    end
  end

  def get
    current_user.relationshps
  end

  def show
    @relationshp = Relationshp.find(params[:id])
  end

  def create
    endp = Time.now + 30.days
    @relationshp = current_user.relationshps.create(libraryebook_id: session[:ebookid], status: "Loaned", loanstart: Time.now, loanend: endp)
    if @relationshp.save
      flash[:success] = "Ebook loaned!"
      redirect_to profile_path
    else
      redirect_to root_url
    end
  end

  def destroy
    @relationshp.destroy
    redirect_to root_url
  end

  private

  def correct_user
    @relationshp = current_user.relationshps.find_by(id: params[:id])
    redirect_to root_url if @relationshp.nil?
  end
end