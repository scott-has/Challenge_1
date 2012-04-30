require './bidster.rb'

describe @bidster do
  before(:each) do
    @bidster = Bidster.new
  end

  it "prunes bid array to minimum of servers or bids" do
	@bidster.bids = [5,4,3,2,1]
	@bidster.servers = 1
	@bidster.prune_bids
    @bidster.bids.length.should eq(1)
    @bidster.bids[0].should eq(5)
  end


  it "prunes bid array to minimum of servers or bids" do
    test_bids = [5,4,3,2,1]
	@bidster.bids = test_bids
	@bidster.servers = 11
	@bidster.prune_bids
    @bidster.bids.length.should eq(5)
    @bidster.bids.should eq(test_bids)
  end


  it "should select bid of 50" do
    test_bids = [50,4,3,2,1]
	@bidster.bids = test_bids
	@bidster.servers = 11
	@bidster.process_bids
    @bidster.rated_bids.length.should eq(1)
    @bidster.rated_bids[0].should eq(50)
  end


    it "should select final bid of 1" do
    test_bids = [5,1,1,1,1,1]
	@bidster.bids = test_bids
	@bidster.servers = 6
	@bidster.process_bids
    @bidster.rated_bids.length.should eq(6)
    @bidster.rated_bids.should eq(test_bids)
  end

      it "should select bid of 5" do
    test_bids = [5,1,1,1,1,1]
	@bidster.bids = test_bids
	@bidster.servers = 4
	@bidster.process_bids
    @bidster.rated_bids.length.should eq(1)
    @bidster.rated_bids[0].should eq(5)
  end

      it "should select bid of 1" do
    test_bids = [1,1,1,1,1]
	@bidster.bids = test_bids
	@bidster.servers = 5
	@bidster.process_bids
    @bidster.rated_bids.length.should eq(5)
    @bidster.rated_bids.should eq(test_bids)
  end


    it "should print 'Final price was 1. Winning bids were: 1'" do
    test_bids = [1]
	@bidster.rated_bids = test_bids
    @bidster.print_bids.should eq('Final price was 1. Winning bids were: 1')
  end

     it "should print 'Final price was 1. Winning bids were: 1'" do
    test_bids = [10,9,8,7,6,5,4,3,2,1]
	@bidster.rated_bids = test_bids
    @bidster.print_bids.should eq('Final price was 1. Winning bids were: 10 9 8 7 6 5 4 3 2 1')
  end

end

