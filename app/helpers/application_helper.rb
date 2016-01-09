module ApplicationHelper
  def flash_class(level)
    case level.to_sym
    when :success then "ui green message"
    when :error then "ui red message"
    end
  end
end
