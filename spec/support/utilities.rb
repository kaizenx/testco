def full_title title=nil
  if title
    "#{Settings.title} | #{title}"
  else
    "#{Settings.title}"
  end
end

def create_params name, hash
  define_method name do |h={}|
    params = hash.dup
    if h.present?
      key = h.keys.first
      params[key] = h[key]
      params
    else
      params
    end
  end
end
