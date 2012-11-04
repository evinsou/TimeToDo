class AgileLaborsController < ApplicationController
  before_filter :authenticate#, :except => :index
  def index
    @agile_labors = AgileLabor.all
    @current_labors = current_user.agile_labors.current_labors
    @backlogged_labors = current_user.agile_labors.backlogged
    @iceboxed_labors = current_user.agile_labors.iceboxed
  end

  def new
    @agile_labor = current_user.agile_labors.new
  end

  def create
    @agile_labor = AgileLabor.new(params[:agile_labor])

    if @agile_labor.save
      redirect_to agile_labors_path, :notice => 'Agile task was successfully created'
    else
      render :action => 'new'
    end
  end

  def edit
    @agile_labor = AgileLabor.find(params[:id])
    respond_to do |format|
      format.html
      format.js
    end
  end

  def update
    @agile_labor = AgileLabor.find(params[:id])

    if @agile_labor.update_attributes(params[:agile_labor])
      redirect_to agile_labors_path, :notice => 'Agile Task updated'
    else
      render :action => 'edit'
    end
  end

  def destroy
    @agile_labor = AgileLabor.find(params[:id])
    @agile_labor.destroy

    respond_to do |format|
#      format.html {redirect_to @new_agile_labor_path, :notice => 'Agile labor deleted'}
      format.html { redirect_to(agile_labors_path) }
      format.xml  { head :ok }
    end
  end
end

