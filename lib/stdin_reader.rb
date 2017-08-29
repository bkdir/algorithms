module StdinReader
  def read_as_int
    read.map(&:to_i)
  end

  def read_as_string
    read
  end

  private
  def read
    arr = []
    $stdin.each_line { |l| arr << l.chomp }
    arr
  end
end
