class DashboardController < ApplicationController

  skip_before_action :ensure_current_user

  def show

  end

  def index
    @rants = Rant.all
  end


end