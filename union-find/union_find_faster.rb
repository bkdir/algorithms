#
# This version, as an improvement, considers sites as nodes. 
# Whole hierarchy is a tree.
# Links nodes together and travels from node to root to figure out if given pair is under
# the same component.
#
# for N sites, order of growths (worst case):
#   find  -> tree height
#   union -> tree height
#
require 'benchmark'

class UnionFindFaster
  @num_of_components = 0

  def initialize n
    @num_of_components = n
    @id = (0...n).to_a
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

  # quick-union
  def union p, q
    p_root, q_root = find(p), find(q)
    return if p_root == q_root

    # Rename p’s root only
    @id[p_root] = q_root

    @num_of_components -= 1
  end
end

arr = File.readlines(ARGV[0]).map(&:strip)
uf = UnionFindFaster.new(arr.shift.to_i)

puts Benchmark.measure {
  arr.each do |pair|
    p,q = pair.split(" ").map(&:to_i)

    next if uf.connected?(p, q)
    uf.union(p,q)

    #puts "#{p} and #{q} are connected."
  end

  puts "There are #{uf.count} components."
}
