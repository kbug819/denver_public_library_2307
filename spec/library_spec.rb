require './lib/book'
require './lib/author'
require './lib/library'

RSpec.describe Library do
  before(:each) do
  @dpl = Library.new("Denver Public Library")

  @harper_lee = Author.new({first_name: "Harper", last_name: "Lee"})
  @charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})

  @jane_eyre = @charlotte_bronte.write("Jane Eyre", "October 16, 1847")    
  @professor = @charlotte_bronte.write("The Professor", "1857")  
  @villette = @charlotte_bronte.write("Villette", "1853")  
  @mockingbird = @harper_lee.write("To Kill a Mockingbird", "July 11, 1960")

end

  describe "#initialize" do
    it "instantiates a new object" do
      expect(@dpl).to be_an_instance_of(Library)
    end

    it "has attributes" do
      expect(@dpl.name).to eq("Denver Public Library")
      expect(@dpl.books).to eq([])
      expect(@dpl.authors).to eq([])
    end
  end

  describe "add_author" do
    it "adds and author to the library list" do
      @dpl.add_author(@charlotte_bronte)
      @dpl.add_author(@harper_lee)
      expect(@dpl.authors).to eq([@charlotte_bronte, @harper_lee])
    end
  end

  describe "publication_time_frame_for" do
    it "shows an authors publication year of first and last book" do
      expect(@dpl.publication_time_frame_for(@charlotte_bronte)).to eq({start: "1847", end: "1857"})
    end
  end
end