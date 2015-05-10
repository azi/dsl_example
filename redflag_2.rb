def event(name, &block)
	@events[name] = block  # => proc
end

def setup(&block)
	@setups << block       # => proc
end

Dir.glob('*events_2.rb').each do |file|
	@setups = []
	@events = {}
	load file  # --> load 進來的file, event block被轉成proc 存到 @events裡(hash 型態)
	           # --> setup 也被轉成proc 存到 @setups裡(array型態)  
	@events.each_pair do |name, event|
		env = Object.new
		@setups.each do |setup|
			env.instance_eval &setup   # ->將proc轉回block執行，也就是設定@sky_height,@mountains_height
			                           # ->CleanRoom用法
		end
		puts "alter: #{name}" if env.instance_eval &event  # ->將proc轉回block執行
	end
end
