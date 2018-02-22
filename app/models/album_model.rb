require_relative '../utils/paths'

class AlbumModel
  attr_accessor :rank
  attr_accessor :title
  attr_accessor :year

  def initialize(rank, title, year)
    @rank = rank
    @title = title
    @year = year
  end
end