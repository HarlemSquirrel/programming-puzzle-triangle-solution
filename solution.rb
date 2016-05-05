#!/usr/bin/ruby

### Solution for Programming Puzzle Triangle
# http://www.yodlecareers.com/programming-puzzle-triangle

### Crafted with coffee by HarlemSquirrel
# https://github.com/HarlemSquirrel

require 'pry'

start_time = Time.now

TRI_FILE = 'triangle.txt'

def load_tri
  @triangle = []
  open(TRI_FILE).each_line do |line|
    @triangle.push(line.split(" ").collect { |n| n.to_i})
  end
  @triangle
end

def find_max_path_sum
  load_tri

  max_sum = 0

  [0,1].repeated_permutation(@triangle.length - 1).each do |p|
    sum = 0
    path = [0]
    p.to_a.each_with_index do |v, i|
      path.push p.to_a.slice(0, i+1).inject :+
    end

    path.each_with_index do |v, i|
      sum += @triangle[i][v]
    end
    max_sum = sum if sum > max_sum
  end

  max_sum
end


max = find_max_path_sum
puts "The max sum for #{TRI_FILE} is #{max}"

exec_time = (Time.now - start_time)
puts "Finished in #{exec_time} seconds!"
