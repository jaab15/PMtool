class HomeController < ApplicationController
  def about
  end

  def index
      @projects = Project.order(created_at: :desc)
  end

end
