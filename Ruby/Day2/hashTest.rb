# class Tree
# 	attr_accessor :children, :node_name


# 	def createTree

# 	end

# 	def initializeHash(hash)



# 		@children = children
# 		@node_name = name
# 	end
		
# 	def initialize(name, children=[])
# 		@children = children
# 		@node_name = name
# 	end
	
# 	def visit_all(&block)
# 		visit &block
# 		children.each {|c| c.visit_all &block}
# 	end
	
# 	def visit(&block)
# 		block.call self
# 	end
# end

# class Tree
# 	attr_accessor :children, :node_name
	
# 	def nextLevel(collection)
# 		if(collection.respond_to? :each)
# 			collection.each do |key, value|
# 				nextLevel(value);
# 				puts "#{key}"
# 			end
# 	end
	
# 	def initialize(collection)
# 		nextLevel(collection)
# 	end
# end


class Tree
	attr_accessor :children, :node_name
	
	def traverseHash(collection)
		currentTree = []
		if(collection.respond_to? :each)
			collection.each do |key, value|
				result = traverseHash(value)
				currentTree.push(Tree.new(key,result))
			end
			return currentTree
		else
			return currentTree
		end
	end

	def initialize(name, children=[])
		if name.respond_to? :each
			level = traverseHash(name)

			@children = level[0].children
			@node_name = level[0].node_name
		else
			@children = children
			@node_name = name
		end
	end

	def visit_all(&block)
		visit &block
		children.each {|c| c.visit_all &block}
	end
	
	def visit(&block)
		block.call self
	end
end

#val = {'a'=>'bbb','b'=>'ccc','c'=>{'1'=>'111','2'=>'222'}}
#val = {'grandpa' => { 'dad' => {'child 1' => {}, 'child2' => {}}, 'uncle' => {'child 3' => {}, 'child 4' => {}}}}
val = {'dad' => {'child 1' => {}, 'child2' => {}}}
# val.each {|key, value| puts "Here: #{key}: #{value}"}

# val.each do |key, value|

# 	puts "Here: #{key}: #{value}"
# end



#ruby_tree = Tree.new( "Ruby",[Tree.new("Reia"),Tree.new("MacRuby")] )
ruby_tree = Tree.new( val )

# puts "Visiting a node"
# ruby_tree.visit {|node| puts node.node_name}

puts "visiting entire tree"
ruby_tree.visit_all {|node| puts node.node_name}