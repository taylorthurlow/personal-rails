class ProjectsController < ApplicationController
  before_action :set_project, only: [:edit, :update, :destroy]
  skip_before_action :authorize, only: [:index]
  respond_to :html
  responders :flash

  # GET /projects
  def index
    @projects = Project.all

    respond_with @projects
  end

  # GET /projects/new
  def new
    @project = Project.new
  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects
  def create
    @project = Project.new(project_params)
    @project.save
    respond_with @project, location: projects_path
  end

  # PATCH/PUT /projects/1
  def update
    @project.update(project_params)
    respond_with @project
  end

  # DELETE /projects/1
  def destroy
    @project.destroy
    respond_with @project
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_project
    @project = Project.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def project_params
    params.require(:project).permit(:name, :url, :description, :image)
  end
end
