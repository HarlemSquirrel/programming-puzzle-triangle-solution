### Solution for Programming Puzzle Triangle
# http://www.yodlecareers.com/programming-puzzle-triangle

### Crafted with coffee by HarlemSquirrel
# https://github.com/HarlemSquirrel

require 'pry'

start_time = Time.now

def load_tri(file)
  @triangle = []
  File.open(file).each_line do |line|
    @triangle.push(line.split(" ").collect { |n| n.to_i})
  end
  @triangle
end

def get_paths
  binding.pry
  paths = [0,1].repeated_permutation(@triangle.length - 1).to_a.map do |path|
    [0].concat(path)
  end

  paths.map! do |path|
    newp = []
    path.each_with_index do |v, i|
      newp.push path.slice(0, i+1).inject :+
    end
    newp
  end
end

def sum_paths
  threads = []
  sums = []
  paths = get_paths
  binding.pry

  paths.each do |path|
    #threads << Thread.new {
      sum = 0
      path.each_with_index do |v, i|
        sum += @triangle[i][v]
      end
      sums << sum
    #}
  end
  #threads.each { |t|
  #  t.join
  #}
  sums
end

def max_path_sum_of(file)
  load_tri(file)
  sum_paths.max
end


file = 'triangle.txt'
max = max_path_sum_of(file)
puts "The max sum for #{file} is #{max}"

exec_time = (Time.now - start_time) #.strftime("%H:%M:%S")
puts "Finished in #{exec_time} seconds"
