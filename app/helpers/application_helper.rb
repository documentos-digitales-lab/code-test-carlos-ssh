module ApplicationHelper
  def flash_class(key)
    case key.to_sym
      when :notice then "bg-green-500"
      when :alert, :error then "bg-red-500"
    else "bg-blue-500"
    end
  end
end
