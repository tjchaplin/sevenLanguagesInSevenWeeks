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

ruby_tree = Tree.new( "Ruby",[Tree.new("Reia"),Tree.new("MacRuby")] )

puts "Visiting a node"
ruby_tree.visit {|node| puts node.node_name}

puts "visiting entire tree"
ruby_tree.visit_all {|node| puts node.node_name}

ruby_hashTree = Tree.new({'grandpa' => { 'dad' => {'child 1' => {}, 'child2' => {}}, 'uncle' => {'child 3' => {}, 'child 4' => {}}}})

puts "Visiting a node on hash tree"
ruby_hashTree.visit {|node| puts node.node_name}

puts "visiting entire hash tree"
ruby_hashTree.visit_all {|node| puts node.node_name}