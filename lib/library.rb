class Library
  attr_reader :name,
              :books,
              :authors
  def initialize(name)
    @name = name
    @books = []
    @authors = []
  end
  
  def add_author(author)
    @authors << author
    author.books.map do |book|
      @books << book
    end
  end

  def publication_time_frame_for(author)
    years = author.books.map do |book|
      book.publication_year
    end
    sorted_years = years.sort_by do |year|
      year
    end
    start_end = Hash.new(0)
    start_end[:start] = sorted_years.first
    start_end[:end] = sorted_years.last
    start_end
  end
end

