module Paths 
  def controllers_path(path_to_append = '')
    File.expand_path(File.join('../../controllers', path_to_append), __FILE__)
  end

  def data_path(path_to_append = '')
    File.expand_path(File.join('../../data', path_to_append), __FILE__)
  end

  def views_path(path_to_append = '')
    File.expand_path(File.join('../../views', path_to_append), __FILE__)
  end
end