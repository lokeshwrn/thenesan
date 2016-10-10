module ApplicationHelper

  def generate_login_keys
    request.url.to_s
  end

  def get_file_img(ext)
    FileExtensionMapping[ext.to_sym] ||= "ico-txt.png"
  end

  def meta_tag(tag, text)
    content_for :"meta_#{tag}", text
  end

  def page_title(text)
    content_for :title, text
  end

  def yield_page_title
    title=content_for?(:title) ? content_for(:title) : @page_properties[:page_title]
    content_tag :title, title
  end

  def yield_meta_tag(tag)
    if @page_properties[:"meta_#{tag}"].present? || content_for?(:"meta_#{tag}")
      value = @page_properties[:"meta_#{tag}"] || content_for(:"meta_#{tag}")
      tag "meta", name: tag, content: value
    else
      nil
    end
  end

end
