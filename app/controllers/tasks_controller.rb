class TasksController < ApplicationController

  before_filter :authenticate, :except => [:index, :show]
  # GET /tasks
  # GET /tasks.xml

  before_filter :check_existance

  def index
    @tasks = Task.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @tasks }
    end
  end

  def recent_tasks # tasks_list
    @tasks = Task.order("finish_by DESC")
    flash.now.notice = "recent"

    respond_to do |format|
      format.html # recent_tasks.html.erb
      format.js
    end
  end

  def early_tasks # tasks_list_downward
    @tasks = Task.order("start_in ASC")
    flash.now.notice = "early"

    respond_to do |format|
      format.html # early_tasks.html.erb
      format.js
    end
  end

  def list
    @tasks = Task.order('tasks.position ASC')
  end

  def sort
    @tasks = Task.all
    @tasks.each do |task|
      task.position = params['task'].index(task.id.to_s) + 1
      task.save
    end
    render :nothing => true
  end

  # GET /tasks/1
  # GET /tasks/1.xml
  def show
    @task = Task.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @task }
    end
  end

  # GET /tasks/new
  # GET /tasks/new.xml
  def new
    @task = Task.new

    respond_to do |format|
      format.html # new.html.erb
      format.js  { render :file => 'tasks/new.js.erb' }
#      format.js  { render :text => $("<%= escape_javascript render(:file => 'tasks/new.html.erb') %>").inserAfter('#tasks'); }
    end
  end

  # GET /tasks/1/edit
  def edit
    #@task = Task.find(params[:id])
    @task = current_user.tasks.find(params[:id])
  end

  # POST /tasks
  # POST /tasks.xml
  def create
    #@task = Task.new(params[:task])
    @task = current_user.tasks.new(params[:task])

    if @task.save
        respond_to do |format|
          format.html { redirect_to @task, :notice => t('tasks.create_success') }
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
    #@task = Task.find(params[:id])
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

  # DELETE /tasks/1
  # DELETE /tasks/1.xml
#  def destroy
#    @task = Task.find(params[:id])
 #   @task = current_user.tasks.find(params[:id])
  #  @task.destroy

   # respond_to do |format|
    #  format.html { redirect_to(tasks_url) }
     # format.xml  { head :ok }
   # end
  #end
  def destroy
    @task = current_user.tasks.find(params[:id])
    @task.destroy

    respond_to do |format|
      format.html {redirect_to @tasks, :notice => 'Task deleted' }
      format.js #{render :text => "$('#task_#{params[:id]}').remove();"}
    end
  end
end
