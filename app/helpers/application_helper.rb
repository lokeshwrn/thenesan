module ApplicationHelper

  def generate_login_keys
    request.url.to_s
  end

  def get_file_img(ext)
    FileExtensionMapping[ext.to_sym] ||= "ico-txt.png"
  end

end
