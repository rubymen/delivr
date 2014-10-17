module ApplicationHelper
  def flash_class(level)
    case level
      when :alert then 'warning'
      when :error then 'danger'
      when :notice then 'info'
      when :success then 'success'
    end
  end
end
