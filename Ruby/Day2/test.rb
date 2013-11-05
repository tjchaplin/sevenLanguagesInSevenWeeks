
class Tree
	attr_accessor :children, :node_name
	
	def traverse(collection)
		children = []
		if collection.respond_to? :each
			collection.each {|key, value| children.push(Tree.new(key,traverse(value)))}
		end
		return children
	end

	def initialize(name, children=[])
		if name.respond_to? :each
			#level = traverse(name)
			#@children = name.shift
			x = name.shift
			visit_all do |node|
				children.push(Tree.new(x[1]))
				puts "key:#{node.node_name} value:#{node.children} x: #{x}"
			end
			@node_name = x[0]
			@children = children
		else
			puts "name: #{name} children: #{children}"
			@children = children
			@node_name = name
		end
	end

	def visit_all(&block)
		visit &block
		if children.respond_to? :each
			children.each {|c| c.visit_all &block}
		end
	end
	
	def visit(&block)
		puts "node_name:#{node_name} children:#{children}"
		block.call self
	end
end

#val = {'a'=>'bbb','b'=>'ccc','c'=>{'1'=>'111','2'=>'222'}}
#val = {'grandpa' => { 'dad' => {'child 1' => {}, 'child2' => {}}, 'uncle' => {'child 3' => {}, 'child 4' => {}}}}
val = {'dad' => {'child 1' => {}, 'child2' => {}}}

# def traverse(collection)
# 	children = []
# 	if collection.respond_to? :each
# 		collection.each {|key, value| children.push({key=>traverse(value)})}
# 	end
# 	return children
# end

# def display(value)
# 	puts "#{value}"
# end

# result = traverse(val)
# display(result)

# val.each {|key, value| puts "Here: #{key}: #{value}"}

# val.each do |key, value|

# 	puts "Here: #{key}: #{value}"
# end



#ruby_tree = Tree.new( "Ruby",[Tree.new("Reia"),Tree.new("MacRuby")] )
 ruby_tree = Tree.new( val )

# # puts "Visiting a node"
# # ruby_tree.visit {|node| puts node.node_name}

# puts "visiting entire tree"
# ruby_tree.visit_all {|node| puts node.node_name}