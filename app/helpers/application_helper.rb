module ApplicationHelper

  def generate_login_keys
    request.url.to_s
  end

  def get_file_img(ext)
    FileExtensionMapping[ext.to_sym] ||= "ico-txt.png"
  end

  def title(text)
    content_for :title, text
  end

  def meta_tag(tag, text)
    content_for :"meta_#{tag}", text
  end

  def yield_meta_tag(tag, default_text='')
    content_for?(:"meta_#{tag}") ? content_for(:"meta_#{tag}") : default_text
  end

end
