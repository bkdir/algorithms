# Dynamic connectivity problem: 
#   Input is a sequence of pairs of integers. Each integer represents an object and
#   we are to interpret the pair p q as meaning "p isconnected to q."
#
#   See .*_test_data.txt files. 
#   Example usage: `ruby union_find.rb small_test_data.txt`
#
# Definitions:
#   site: Objects (p or q).
#   connections: pairs.
#   component: includes multiple sites.
#
# Purpose is to connect p and q only if they are not already in the same component.
#
# Use cases: 
#  Networks: p and q might be 2 computer in the network
#  Social Media: p and q might represent 2 people and pairs might represent friendship
#  Variable-name equivalence.
#  Mathematical sets: are p and q in the same set? if not, unite p's set and q's set.
#
# for N sites, order of growths (worst case):
#   find  -> 1
#   union -> N
#
require 'benchmark'

class UnionFind
  @num_of_components = 0

  def initialize n
    @num_of_components = n
    # all sites in a component must have the same value in id[].
    @id = (0...n).to_a
  end

  def count
    @num_of_components
  end

  # whether two sites are in the same component
  def connected? p, q
    find(p) == find(q)
  end

  # quick find
  def find p
    @id[p]
  end

  # merge two components if the two sites are in different components
  def union p, q
    p_id, q_id = find(p), find(q)
    return if p_id == q_id # already in the same component

    # Rename p’s component to q’s name(goes through the whole array) 
    for i in 0...@id.length
      @id[i] = q_id if @id[i] == p_id
    end

    @num_of_components -= 1
  end
end

arr = File.readlines(ARGV[0]).map(&:strip)
uf = UnionFind.new(arr.shift.to_i)

puts Benchmark.measure {
  arr.each do |pair|
    p,q = pair.split(" ").map(&:to_i)
    next if uf.connected?(p, q)

    uf.union(p,q)

    puts "#{p} and #{q} are connected."
  end

  puts "There are #{uf.count} components"
}
