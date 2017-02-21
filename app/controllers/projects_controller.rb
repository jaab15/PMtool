class ProjectsController < ApplicationController
  NBR_LINE = 7

  def new
     @project = Project.new
  end

  def edit
      @project = Project.find params[:id]
  end

  def create
      require_project

      @project = Project.new(@project_params)
      # @product.user = current_user

      if  @project.save
          redirect_to root_path(@project)
      else
          render :new
      end
  end

  def show
      @project = Project.find params[:id]
  end

  def destroy
      @project = Project.find params[:id]
      @project.destroy
      redirect_to root_path
  end

  def update
      @project = Project.find(params[:id])
      require_project

      if @project.update(@project_params)
         redirect_to project_path
      else
         render 'edit'
     end
  end

  end

  private

  def require_project
      @project_params = params.require(:project).permit(
                                                     :title,
                                                     :description,
                                                     :due_date
                                                     )
  end

  def pagine
      @nbrReq = Request.count
      calc_HowManyPages
      @pageoff = (params[:page].to_i - 1) * NBR_LINE

      @requests = Request.all.limit(NBR_LINE).offset(@pageoff)
  end

  def calc_HowManyPages
      if @nbrReq != nil && @nbrReq != 0
         @nbrPage = (@nbrReq / NBR_LINE).ceil
         if @nbrReq % NBR_LINE > 0
            @nbrPage = @nbrPage + 1
         end
      end
  end
