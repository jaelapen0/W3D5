require_relative "00_tree_node"
require "byebug"
class KnightPathFinder
    attr_reader :root_node
    attr_accessor :consider_positions
    def initialize(pos)
        @consider_positions = [pos]
        @root_node = PolyTreeNode.new(pos)
        @move_tree = build_move_tree(self)
        
    end

    #   initial pos = Root Node
    # root node. children << build move tree 
#
#
#
    def build_move_tree(pos)
        parent = PolyTreeNode.new(pos)
        new_move_positions(pos).each do |new_pos|
            new_node = PolyTreeNode.new(new_pos)
            new_node.parent=(parent)
        
        end  
    end

    def self.within_bounds?(poss_moves)
        trimmed_list = []
        poss_moves.each do |pos|
            trimmed_list << pos if pos.all? {|el| el >= 0 && el < 8}   
        end
        trimmed_list
    end

    def self.valid_moves(pos) # return an array of at most 8 pos
      
        row, col = pos#.root_node.value
         # debugger
        poss_moves = [
            [row-2, col+1],
            [row-1, col+2],
            [row+2, col+1],
            [row+1, col+2],
            [row+2, col-1],
            [row+1, col-2],
            [row-2, col-1],
            [row-1, col-2],
        ]
        
        trimmed = within_bounds?(poss_moves)
    end



    def new_move_positions(pos)
        debugger
        arr = pos.root_node.value
       new_list = KnightPathFinder.valid_moves(pos) - @consider_positions
       #elf.consider_positions += KnightPathFinder.valid_moves(pos)
       #new_list
       @consider_positions = @consider_positions + new_list
       new_list 
    end
        

end