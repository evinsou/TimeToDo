module AgileLaborsHelper
  def labors_from_scope(labor_scope)
    labor_scope.each do |agile_labor|
      render :partial => 'agile_labors/agile_labor', :locals => {:agile_labor=>agile_labor}
    end
  end
end

