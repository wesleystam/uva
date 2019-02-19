module ApplicationHelper
  def validation_errors(form_object, attribute)
    form_object.object.errors.full_messages_for(attribute).map do |message|
      content_tag(:div, raw(message), class: 'alert alert-danger')
    end.join.html_safe
  end
end
