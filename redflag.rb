def event(name)
  puts "Alter: #{name}" if yield
end

# http://www.w3cschool.cc/ruby/ruby-dir-methods.html
# http://ruby-doc.org/core-2.2.0/Dir.html#method-c-glob
Dir.glob('*events_0.rb').each {|file| load file}

