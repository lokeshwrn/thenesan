module ApplicationHelper

def generate_login_keys
request.url.to_s
end

end
