module TasksHelper
  def color_picker(var)
    case var
      when 'yesterday' || 1
        "for-yesterday"
      when 'today' || 2
        "for-today"
      when 'for a week' || 3
        "for-week"
      when 'for a month' || 4
        "for-month"
      when 'for half year' || 5
        "for-halfyear"
      else
        "no-durations"
    end
  end
  def have_durations(obj)
    obj.durations.any? ? obj.durations[0][:time_limit] : 'empty'
  end
end

#1 yesterday
#2 today
#3 for a week
#4 for a month
#5 for a half year
=begin
    what kind of duration <%= task.durations.any? ? task.durations[0][:time_limit] : 'empty'%><br />
    what kind of class for duration <%= color_picker(have_durations(task)) %><br />
    or else variation <%= task.durations.any? ? color_picker(task.durations[0][:time_limit]) : 'empty'%><br />
=end
#'yesterday'
#'today'
#'for a week'
#'for a month'
#'for half year'

