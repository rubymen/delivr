module ApplicationHelper
  def flash_class(level)
    case level
      when :alert then 'warning'
      when :error then 'danger'
      when :notice then 'info'
      when :success then 'success'
    end
  end

  def statistics_number
    {
      orders: Order.count,
      types: Type.count,
      categories: Category.count,
      users: User.count,
    }
  end
end
