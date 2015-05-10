lambda{
	setups = []
	events = {}

	Kernel.send :define_method, :event do |name, &block|
		events[name] = block
	end

	Kernel.send :defind_method, :setup do |&blcok|
		setups << block
	end

	Kernel.send :define_method, :each_event do |&block|
		events.each_pair do |name, event|
			block.call name, event
		end
	end

	Kernel.send :define_method, :each_setup do |&block|
		setups.each do |setup|
			block.call setup
		end
	end

}.call


Dir.glob('*events_2.rb').each do |file|
	load file
	
	each_event do |name, event|
		env = Object.new
		each_setup do |setup|
			env.instance_eval &setup
		end
		puts "alter: #{name}" if env.instance_eval &event
	end

	# each_event {|name, event| .....} 

	# def each_event(&block)
	# 	events.each_pair do |name, event|
	# 		block.call name, event
	# 	end
	# end
end