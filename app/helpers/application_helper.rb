module ApplicationHelper
  def step_wrapper(steps)
    split_paragraphs(sanitize(steps)).map { |paragraph|
        content_tag(:div, content_tag(:div, raw(paragraph), class: 'panel-body'), class: 'panel panel-default step-panel')
      }.join("\n\n").html_safe
  end

  def split_paragraphs(text)
    text.lines.map(&:strip).reject(&:empty?)
  end
end