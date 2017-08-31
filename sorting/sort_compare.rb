require_relative 'selection_sort'
require_relative 'insertion_sort'
require_relative 'shell_sort'
require 'Benchmark'

include Algorithms

#
# both sort algorithms will sort the same arrays:
# 100 arrays with 1k elements each
#
insertion_test = []
100.times do |i|
  insertion_test[i] = (0...1000).map{ rand(0...1000) } 
end
selection_test = insertion_test.map{ |arr| arr.dup}
shell_test = insertion_test.map{ |arr| arr.dup}

Benchmark.bm(7) do |x|
  x.report ("Shell:    ") { 100.times { |i| ShellSort.sort shell_test[i] } }
  x.report ("Insertion:") { 100.times { |i| InsertionSort.sort insertion_test[i] } }
  x.report("Selection:") { 100.times { |i| SelectionSort.sort selection_test[i] } }

  puts shell_test.reject { |arr| ShellSort.sorted? arr }.any? ? "Shell Sort Failed" : ""
  puts insertion_test.reject { |arr| InsertionSort.sorted? arr }.any? ? "Insertion Sort Failed" : ""
  puts selection_test.reject { |arr| SelectionSort.sorted? arr }.any? ? "Selection Sort Failed" : ""
end
