def load_from_file
    data = []

    CSV.foreach(data_path(@file_name)) do |row|
      data.push({ number: $., name: row[0], year: row[1] })
    end

    data
  end