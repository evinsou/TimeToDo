class TasksController < ApplicationController

  before_filter :authenticate
  # GET /tasks
  # GET /tasks.xml

  def index
    @tasks = current_user.tasks
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @tasks }
    end
  end
  # GET /tasks/1
  # GET /tasks/1.xml
  def show
    @task = current_user.tasks.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @task }
    end
  end
  # GET /tasks/new
  # GET /tasks/new.xml
  def new
    @task = current_user.tasks.new
#    respond_to do |format|
#      format.html # new.html.erb
#      format.js  { render :file => 'tasks/new.js.erb' }
#      format.js  { render :text => $("<%= escape_javascript render(:file => 'tasks/new.html.erb') %>").inserAfter('#tasks'); }
#    end
  end
  # GET /tasks/1/edit
  def edit
    @task = current_user.tasks.find(params[:id])
  end
  # POST /tasks
  # POST /tasks.xml
  def create
    @task = current_user.tasks.new(params[:task])
    if @task.save
       respond_to do |format|
         format.html { redirect_to task_path(@task), :notice => t('tasks.create_success') }
         format.js  #{ render :xml => @task, :status => :created, :location => @task }
       end
    else
       respond_to do |format|
         format.html { render :action => "new" }
         format.js  { render 'fail_create.js.erb'}#:xml => @task.errors, :status => :unprocessable_entity }
       end
    end
  end
  # PUT /tasks/1
  # PUT /tasks/1.xml
  def update
    @task = current_user.tasks.find(params[:id])
    respond_to do |format|
      if @task.update_attributes(params[:task])
        format.html { redirect_to(@task, :notice => t('tasks.update_success')) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @task.errors, :status => :unprocessable_entity }
      end
    end
  end
  def destroy
    @task = current_user.tasks.find(params[:id])
    @task.destroy
    respond_to do |format|
      format.html {redirect_to root_path, :notice => 'Task deleted' }
      format.js
    end
  end
  def recent_tasks
    @tasks = Task.tasks_own_by(current_user).order("finish_by DESC")
    respond_to do |format|
      format.html # recent_tasks.html.erb
      format.js
    end
  end

  def early_tasks
    @tasks = Task.tasks_own_by(current_user).order("start_in ASC")
    respond_to do |format|
      format.html # early_tasks.html.erb
      format.js
    end
  end
  def list
    @tasks = Task.tasks_own_by(current_user).order('tasks.position ASC')
  end
  def sort
#    @tasks = Task.tasks_own_by(current_user)
    @tasks = current_user.tasks
    @tasks.each do |task|
      task.position = params['task'].index(task.id.to_s) + 1
      task.save
    end
=begin
    params[:task].each_with_index do | id, index|
      Task.update_all({position: index+1}, {id: id })
    end
=end
    render :nothing => true
  end
  def done
    @task = current_user.tasks.find(params[:id])
    @task.update_attribute :is_done, true
    redirect_to tasks_path, :notice => 'thanks you and congratulations. task is done'
  end
  def undone
    @task = current_user.tasks.find(params[:id])
    @task.update_attribute :is_done, false
    redirect_to tasks_path
  end
end

