require "byebug"

class PolyTreeNode
  attr_accessor :parent, :children
  attr_reader :value

  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end

  def parent=(node)
    #debugger
    old_parent = @parent
    old_parent.children.delete(self) unless old_parent == nil
    @parent = node 
    @parent.children << self unless @parent.nil? || @parent.children.include?(self)  
  end

  def add_child(child_node)
    child_node.parent=(self)
  end

  def remove_child(child_node)
    #debugger
    raise "node is not a child" unless self.children.include?(child_node)
    self.children.delete(child_node) 
    child_node.parent=(nil)
  end
      
  def dfs(target_value)
    return self if self.value == target_value
    return nil if self.children.empty?
    self.children.each do |child|
      search_result = child.dfs(target_value)
      return search_result unless search_result.nil?
    end
    nil
  end

  def bfs(target_value)
    queue = [self]
    until queue.empty?
      ele = queue.shift
        if ele.value == target_value
          return ele
        else 
          ele.children.each {|child| queue.push(child)}
        end
    end
    nil
  end

end