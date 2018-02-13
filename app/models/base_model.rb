require 'csv'
require_relative '../utils/paths'

class BaseModel
  include Paths

  def initialize(file_name)
    @file_name = file_name
  end

  def load_from_file
    data = []

    CSV.foreach(data_path(@file_name)) do |row|
      data.push({ number: 1, name: row[0], year: row[1] })
    end

    # @data = @data.sort {|x,y| x[:name] <=> y[:name] }
    data
  end
end