class Projects::TasksController < ApplicationController
#  before_filter :authenticate#, :except => [:index, :show]
  def index
    @project = Project.find(params[:project_id])
    @tasks = @project.tasks
  end
  # GET /tasks/1
  # GET /tasks/1.xml
  def show
    @project = Project.find(params[:project_id])
    @task = @project.tasks.find(params[:id])
  end

  # GET /tasks/new
  # GET /tasks/new.xml
  def new
    @project = Project.find(params[:project_id])
    @task = @project.tasks.new
  end
  # POST /tasks
  # POST /tasks.xml
  def create
    @project = Project.find(params[:project_id])
    @task = @project.tasks.new(params[:task])
    if @task.save
       respond_to do |format|
         format.html { redirect_to projects_path, :notice => t('tasks.create_success') }
         format.js
       end
    else
       respond_to do |format|
         format.html { render :action => "new" }
         format.js  { render 'fail_create.js.erb'}
       end
    end
  end
  # GET /tasks/1/edit
  def edit
    @project = Project.find(params[:project_id])
    @task = @project.tasks.find(params[:id])
  end
  # PUT /tasks/1
  # PUT /tasks/1.xml
  def update
    @project = Project.find(params[:project_id])
    @task = @project.tasks.find(params[:id])
    respond_to do |format|
      if @task.update_attributes(params[:task])
        format.html { redirect_to(@project, :notice => t('tasks.update_success')) }
      else
        format.html { render :action => "edit" }
      end
    end
  end
  def destroy
    @project = Project.find(params[:project_id])
    @task = @project.tasks.find(params[:id])
    @task.destroy
    redirect_to root_path, :notice => 'Task deleted'
  end
end
