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
      data.push({ number: $., name: row[0], year: row[1] })
    end

    data
  end

  def sort_data_by(sort_key, data)
    valid_sort_keys = ['name', 'number', 'year']

    if (valid_sort_keys.include?(sort_key))
      data.sort_by {|row| 
        row = row[sort_key.to_sym]
        sort_key != 'number' ? row.gsub("'", '') : row
      }
    else
      data
    end
  end
end