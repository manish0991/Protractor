pid = Process.spawn ('ruby.exe runtest.rb')

Process.wait(pid)

puts "Finished !!"