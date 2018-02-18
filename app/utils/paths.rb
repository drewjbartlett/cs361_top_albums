module Paths 
  def base_path(path_to_prepend = '', path_to_append = '')
    File.expand_path(File.join("../../#{path_to_prepend}", path_to_append), __FILE__)
  end

  def controllers_path(path_to_append = '')
    base_path('controllers', path_to_append)
  end

  def data_path(path_to_append = '')
    base_path('data', path_to_append)
  end

  def views_path(path_to_append = '')
    base_path('views', path_to_append)
  end
end