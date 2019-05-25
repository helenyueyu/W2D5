class Node
  attr_reader :key
  attr_accessor :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # optional but useful, connects previous link to next link
    # and removes self from list.
  end
end

class LinkedList
  include Enumerable
  def initialize
    @head = Node.new 
    @tail = Node.new
    @head.next = @tail 
    @tail.prev = @head 
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    @head.next
  end

  def last
    @tail.prev
  end

  def empty?
    @head.next == @tail 
  end

  def get(key)
    each{|node| return node.val if node.key == key}
    nil
  end

  def include?(key)
    return false if get(key).nil?
    true
  end

  def append(key, val)

    node = Node.new(key, val)

    @tail.prev.next = node 
    node.prev = @tail.prev
    
    @tail.prev = node
    node.next = @tail 
  end

  def update(key, val)
    each{|node| node.val = val if node.key == key}
  end

  def remove(key)
    curr_node = nil
    
    each{|node| curr_node = node if node.key == key}

    curr_node.prev.next = curr_node.next 
    curr_node.next.prev = curr_node.prev
  end

  def each(&prc)
    curr_node = @head.next 
    while curr_node != @tail 
      prc.call(curr_node)
      curr_node = curr_node.next 
    end
  end

  # uncomment when you have `each` working and `Enumerable` included
  # def to_s
  #   inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  # end
end
