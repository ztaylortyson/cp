class NcfsController < ApplicationController
    


  def new
  end

  def index
    @ncfs = Ncf.all
  end

  def create
    @ncf =Ncf.new(ncf_params) 

    respond_to do |format|
      if @ncf.save
        format.html { redirect_to ncf_url(@ncf), notice: "New Case Filing was successfully created." }
        format.json { render :show, status: :created, location: @ncf }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @ncf.errors, status: :unprocessable_entity }
      end
    end

  end

  def update
  end

  def destroy
  end


  private

  def set_ncf
    @ncf = Ncf.find(params[:id])
  end

  def ncf_params
    params.require(:ncf).permit(:name)
  end

end

# url = "http://www.sandiego.courts.ca.gov/portal/online/newfiles/nf_cv_#{first_letter}.html"
