#
# This version uses Weighted quick union and maintains an additional array '@size' to 
# keep track of the tree sizes. 
# Before assigning one root to another it checks the size of the tree and assigns 
# smaller one to the larger tree. 
#
# The height of every tree of size k in # the forest is at most lg k.
# 
# for N sites, order of growths (worst case):
#   find  -> logN
#   union -> logN
#
require 'benchmark'

class UnionFindFastest
  @num_of_components = 0

  def initialize n
    @num_of_components = n
    @id = (0...n).to_a
    @size = Array.new(n,1) # all nodes have initial tree size of 1.
  end

  def count
    @num_of_components
  end

  # whether two sites are in the same component
  def connected? p, q
    find(p) == find(q)
  end

  def find p
    # After the @id is initialized, every node has a link to itself.
    # So, travel till the root...
    p = @id[p] while p != @id[p]
    p
  end

  # weighted quick-union
  def union p, q
    p_root, q_root = find(p), find(q)
    return if p_root == q_root

    # smaller root points to larger root
    if @size[p_root] < @size[q_root]
      @id[p_root] = q_root 
      @size[q_root] += @size[p_root]
    else
      @id[q_root] = p_root
      @size[p_root] += @size[q_root]
    end

    @num_of_components -= 1
  end
end

arr = File.readlines(ARGV[0]).map(&:strip)
uf = UnionFindFastest.new(arr.shift.to_i)

puts Benchmark.measure {
  arr.each do |pair|
    p,q = pair.split(" ").map(&:to_i)

    next if uf.connected?(p, q)
    uf.union(p,q)

    #puts "#{p} and #{q} are connected."
  end

  puts "There are #{uf.count} components."
}
