module ApplicationHelper
  def bootstrap_class_for(flash_type)
    case flash_type
    when 'notice' then 'info'
    when 'alert' then 'danger'
    else flash_type.to_s
    end
  end
end
