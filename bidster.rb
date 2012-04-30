class Bidster
	attr_accessor :servers
	attr_accessor :bids
	attr_accessor :rated_bids


	def prune_bids
		@bids.length < servers ? @bids : @bids = @bids.slice(0,servers)
		#puts "prune_bids = #{@bids}"
	end

	def rate_bids
		optimal_bid, optimal_bid_index = 0
		@bids.each_with_index  do |item, index| 
			if optimal_bid < item * (index + 1)  then 
				optimal_bid = item * (index + 1)
				optimal_bid_index = index
			end
		end
		@rated_bids = @bids.slice(0, optimal_bid_index + 1)
	end

	def print_bids
		result_report = "Final price was #{@rated_bids.last}. Winning bids were: #{@rated_bids.join(" ")}"
		puts result_report
		return result_report
	end

	def process_bids
		prune_bids
		rate_bids 
		return self
	end

end # class