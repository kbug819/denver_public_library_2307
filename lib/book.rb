class Book
  attr_reader :title,
              :author,
              :publication_year
  def initialize(book_information)
    @author = book_information[:author_first_name] + " " + book_information[:author_last_name]
    @author_last_name = book_information[:author_last_name]
    @title = book_information[:title]
    @publication_year = book_information[:publication_date].split(" ")[2]
  end

end