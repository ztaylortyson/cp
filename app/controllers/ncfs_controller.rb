class NcfsController < ApplicationController
  def new
  end

  def index
    @ncfs = Ncf.all
  end

  def create
  end

  def update
  end

  def destroy
  end
end

# url = "http://www.sandiego.courts.ca.gov/portal/online/newfiles/nf_cv_#{first_letter}.html"
