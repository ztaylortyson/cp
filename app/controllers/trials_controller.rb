class TrialsController < ApplicationController
  
  include TrialCalendars

  def index
    launch
  end
end
