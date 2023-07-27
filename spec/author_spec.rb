require './lib/book'
require './lib/author'

RSpec.describe Author do
  before(:each) do
  @book = Book.new({author_first_name: "Harper", author_last_name: "Lee", title: "To Kill a Mockingbird", publication_date: "July 11, 1960"})
  @charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
end

  describe "#initialize" do
    it "instantiates a new object" do
      expect(@charlotte_bronte).to be_an_instance_of(Author)
    end

    it "has attributes" do
      expect(@charlotte_bronte.name).to eq("Charlotte Bronte")
      expect(@charlotte_bronte.books).to eq([])
    end
  end

  describe "#write" do
    it "creates a book written by an author" do
      @jane_eyre = @charlotte_bronte.write("Jane Eyre", "October 16, 1847")
      @villette = @charlotte_bronte.write("Villette", "1853")
      expect(@jane_eyre.title).to eq("Jane Eyre")
      expect(@jane_eyre.class).to eq(Book)
      expect(@charlotte_bronte.books).to eq([@jane_eyre, @villette])
    end 
  end

  describe "#books" do
    it "holds a list of books the author wrote" do
      expect(@charlotte_bronte.books).to eq([])
      @jane_eyre = @charlotte_bronte.write("Jane Eyre", "October 16, 1847")
      @villette = @charlotte_bronte.write("Villette", "1853")
      expect(@charlotte_bronte.books).to eq([@jane_eyre, @villette])
    end
  end
end