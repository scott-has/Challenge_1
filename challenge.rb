require './bidster'
bidster = Bidster.new
bidster.bids = ARGV[0].split(",").map{|str| str.to_i}
bidster.servers = ARGV[1].to_i
bidster.process_bids.print_bids




