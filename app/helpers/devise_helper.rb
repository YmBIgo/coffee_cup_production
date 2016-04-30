module DeviseHelper
  def devise_error_messages!
    return "" unless devise_error_messages?

    messages = resource.errors.full_messages.map { |msg| content_tag(:li, msg) }.join
    sentence = I18n.t("errors.messages.not_saved",
                      :count => resource.errors.count,
                      :resource => resource.class.model_name.human.downcase)

    html = <<-HTML
    <h5 id="error_explanation" class="alert alert-coffee" style="width:500px; margin:0 auto;">
    <u><i class="fa fa-exclamation-triangle"></i>　
      <strong>
      <span style="font-size:18px;">#{sentence}</span></u>
      <br><br>
      <span style="line-height:20px">#{messages}</span>
      </strong>
    </h5>
    <br>
    HTML

    html.html_safe
  end

  def devise_error_messages?
    !resource.errors.empty?
  end

end