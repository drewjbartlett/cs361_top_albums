module Paths 
  def base_path(path_to_append = '')
    File.expand_path(File.join('../../', path_to_append), __FILE__)
  end

  def controllers_path(path_to_append = '')
    File.expand_path(File.join('../../controllers', path_to_append), __FILE__)
  end

  def data_path(path_to_append = '')
    File.expand_path(File.join('../../data', path_to_append), __FILE__)
  end

  def models_path(path_to_append = '')
    File.expand_path(File.join('../../models', path_to_append), __FILE__)
  end

  def views_path(path_to_append = '')
    File.expand_path(File.join('../../views', path_to_append), __FILE__)
  end
end