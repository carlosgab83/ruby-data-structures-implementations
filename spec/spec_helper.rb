RSpec.configure do |config|

end

require_relative '../max_heap.rb'
require_relative '../min_heap.rb'
require_relative '../dijkstra.rb'
Dir[('graph/*.rb'), ('sorting/*.rb')].each { |f| require_relative "../#{f}" }
require 'pry'