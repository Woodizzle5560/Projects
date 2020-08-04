class PolyTreeNode
    
    attr_reader :children, :value, :parent

    def initialize(value)
        @value = value 
        @parent = nil
        @children = []
    end

    
    def parent=(new_parent) #node = self.parent
        if self.parent != nil 
            past_children = self.parent.children
            past_children.delete(self)
        end
        
        new_parent.children << self if new_parent != nil 

        @parent = new_parent
    end


    def add_child(child)
        child.parent = self
    end


    def remove_child(child)
        raise if !child.parent
        child.parent = nil
    end

# First, check the value at this node. 
# If a node's value matches the target value, return the node.
# If not, iterate through the #children and repeat.

    def dfs(target_value)
        return self if self.value == target_value
 
        self.children.each do |child|
            chosen_one = child.dfs(target_value)
            return chosen_one if chosen_one
        end

        nil
    end


    def bfs(target_value)
        que = [self]

        until que.empty? 
            node = que.shift
            que += node.children
            return node if node.value == target_value
        end

        nil
    end





end

# arr[0] method(arr[1..-1])


# #child3 = PolyTreeNode.new
# #child4 = PolyTreeNode.new

# children [ child1, child2, child3]

# child1.children = [child4, child5]


#                      root
# child1             child2         child3
# ch 4,  child 5      child7
# child6
# leaf_node
